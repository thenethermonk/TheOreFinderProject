import { world, system, EquipmentSlot, } from "@minecraft/server";
import { ModalFormData } from "@minecraft/server-ui";
world.beforeEvents.itemUse.subscribe((e) => {
    const { source, itemStack } = e;
    if (source.isSneaking) {
        let equippable = source.getComponent("equippable");
        const item = equippable?.getEquipmentSlot(EquipmentSlot.Mainhand);
        if (item.getItem() != undefined &&
            item.typeId.startsWith("the_ore_finder_project:") &&
            item.typeId.endsWith("_goggles")) {
            e.cancel = true;
            let name = String(item.typeId);
            name = name.replace("the_ore_finder_project:", "");
            name = name.replace("_goggles", "");
            system.run(() => {
                showGoggleOptions(source, item, name + " Goggles - Options");
            });
        }
    }
});
function showGoggleOptions(player, item, title) {
    let options = { dd: false };
    if (item.getDynamicProperty("options") != undefined) {
        options = JSON.parse(item.getDynamicProperty("options"));
    }
    const modalForm = new ModalFormData().title(title);
    modalForm.toggle("Double Distance", options.dd);
    modalForm
        .show(player)
        .then((formData) => {
        if (formData.formValues) {
            let saveOptions = {
                dd: formData.formValues[0],
            };
            item.setDynamicProperty("options", JSON.stringify(saveOptions));
            if (saveOptions.dd == true) {
                item.setLore(["§gDouble Distance: §aEnabled"]);
            }
            else {
                item.setLore(["§gDouble Distance: §8Disabled"]);
            }
        }
    })
        .catch((error) => {
        player.sendMessage("Failed to show form: " + error);
        return -1;
    });
}
system.runInterval(() => {
    for (let player of world.getPlayers()) {
        let ops = getEquipmentOptions(player);
        if (JSON.stringify(ops) !== "{}") {
            Object.entries(ops).forEach(([name, options]) => {
                if (options.dd != undefined && options.dd == true) {
                    player.runCommand("function blocks/find_" + name + "_double_distance");
                }
                else {
                    player.runCommand("function blocks/find_" + name);
                }
            });
        }
        player.runCommand("execute as @e[tag=torp_entity] at @s unless entity @s[tag=visible] run kill @s");
        player.runCommand("execute as @e[tag=visible] at @s run tag @s remove visible");
    }
}, 5);
function getEquipmentOptions(p) {
    let ops = {};
    let equippable = p.getComponent("equippable");
    let slots = [
        equippable?.getEquipmentSlot(EquipmentSlot.Mainhand),
        equippable?.getEquipmentSlot(EquipmentSlot.Head),
        equippable?.getEquipmentSlot(EquipmentSlot.Offhand),
    ];
    slots.forEach((item) => {
        if (item.getItem() != undefined &&
            item.typeId.startsWith("the_ore_finder_project:") &&
            item.typeId.endsWith("_goggles")) {
            let name = String(item.typeId);
            name = name.replace("the_ore_finder_project:", "");
            name = name.replace("_goggles", "");
            if (item.getDynamicProperty("options") != undefined) {
                Object.assign(ops, {
                    [name]: Object(JSON.parse(item.getDynamicProperty("options"))),
                });
            }
            else {
                Object.assign(ops, { [name]: {} });
            }
        }
    });
    return ops;
}
world.beforeEvents.worldInitialize.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("the_ore_finder_project:ore_finder_component", {
        onPlace(arg) {
            let pos = arg.block.location;
            let previous_ore = arg.block.type.id;
            let the_name = arg.block.type.id;
            the_name = the_name.replace("minecraft:", "");
            the_name = the_name.replace("the_ore_finder_project:", "");
            the_name = the_name.replace("_placeholder", "");
            the_name = the_name.replace("deepslate_", "");
            the_name = the_name.replace("nether_", "");
            the_name = the_name.replace("lit_", "");
            the_name = the_name.replace("raw_", "");
            the_name = the_name.replace("block", "ore");
            let entlist = arg.dimension.getEntitiesAtBlockLocation(pos);
            if (entlist.find((e) => e.typeId === "the_ore_finder_project:vanilla_indicator_entity") == undefined) {
                pos.x += 0.5;
                pos.z += 0.5;
                const ore = arg.dimension.spawnEntity("the_ore_finder_project:vanilla_indicator_entity", pos);
                ore.triggerEvent("the_ore_finder_project:" + the_name);
                ore.addTag("torp_entity");
                ore.addTag("visible");
                ore.addTag(the_name);
            }
        },
    });
});
world.afterEvents.playerBreakBlock.subscribe((e) => {
    for (let p of world.getPlayers()) {
        let ents = p.dimension.getEntitiesAtBlockLocation(e.block);
        for (let ent of ents) {
            if (ent.typeId == "the_ore_finder_project:vanilla_indicator_entity") {
                ent.remove();
            }
        }
    }
});
