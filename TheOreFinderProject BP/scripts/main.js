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
            system.run(() => {
                showGoggleOptions(source, item);
            });
        }
    }
});
function showGoggleOptions(player, item) {
    let options = { dd: false, effect: 1 };
    let effects = ["None", "Dynamic Torch"];
    if (item.typeId == "the_ore_finder_project:overworld_goggles" ||
        item.typeId == "the_ore_finder_project:universal_goggles") {
        options.effect = 2;
        effects.push("Night Vision");
    }
    if (item.getDynamicProperty("options") != undefined) {
        options = {
            ...options,
            ...JSON.parse(item.getDynamicProperty("options")),
        };
    }
    const modalForm = new ModalFormData().title({
        translate: item.typeId + "_options",
    });
    modalForm.dropdown("\nEffect", effects, options.effect);
    modalForm.toggle("Double Distance\n\n", options.dd);
    modalForm
        .show(player)
        .then((formData) => {
        if (formData.formValues) {
            let saveOptions = {
                dd: formData.formValues[1],
                effect: formData.formValues[0],
            };
            item.setDynamicProperty("options", JSON.stringify(saveOptions));
            let lore = [];
            if (saveOptions.dd == true) {
                lore.push("§gDouble Distance: §aEnabled");
            }
            else {
                lore.push("§gDouble Distance: §8Disabled");
            }
            if (saveOptions.effect == 1) {
                lore.push("§gEffect: §aTorch");
            }
            else if (saveOptions.effect == 2) {
                lore.push("§gEffect: §aNight Vision");
            }
            else {
                lore.push("§gEffect: §8Disabled");
            }
            item.setLore(lore);
        }
    })
        .catch((error) => {
        player.sendMessage("Failed to show form: " + error);
        return -1;
    });
}
system.runInterval(() => {
    for (let player of world.getPlayers()) {
        player.runCommand('execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=9]');
        player.runCommand("execute as @e[tag=night_vision] at @s run tag @s remove night_vision");
        let ops = getEquipmentOptions(player);
        if (JSON.stringify(ops) !== "{}") {
            Object.entries(ops).forEach(([name, options]) => {
                if (options.dd != undefined && options.dd == true) {
                    player.runCommand("function blocks/find_" + name + "_double_distance");
                }
                else {
                    player.runCommand("function blocks/find_" + name);
                }
                if (options.slot == EquipmentSlot.Head &&
                    (options.effect == undefined || options.effect != 0)) {
                    if (options.effect == 1) {
                        player.runCommand('execute as @a at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep');
                    }
                    if (options.effect == 2) {
                        player.addTag("night_vision");
                        player.runCommand("execute as @a[tag=night_vision] run effect @s night_vision 30 0 true");
                    }
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
        EquipmentSlot.Mainhand,
        EquipmentSlot.Head,
        EquipmentSlot.Offhand,
    ];
    slots.forEach((slot) => {
        let item = equippable?.getEquipmentSlot(slot);
        if (item.getItem() != undefined &&
            item.typeId.startsWith("the_ore_finder_project:") &&
            item.typeId.endsWith("_goggles")) {
            let name = String(item.typeId);
            name = name.replace("the_ore_finder_project:", "");
            name = name.replace("_goggles", "");
            if (item.getDynamicProperty("options") != undefined) {
                Object.assign(ops, {
                    [name]: {
                        ...{ slot: slot },
                        ...{ item: item },
                        ...Object(JSON.parse(item.getDynamicProperty("options"))),
                    },
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
