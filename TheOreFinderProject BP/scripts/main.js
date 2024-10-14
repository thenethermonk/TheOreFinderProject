import { world, system, EquipmentSlot, } from "@minecraft/server";
import { ModalFormData } from "@minecraft/server-ui";
world.beforeEvents.itemUse.subscribe((e) => {
    const { source, itemStack } = e;
    if (source.isSneaking) {
        let equippable = source.getComponent("equippable");
        const item = equippable?.getEquipmentSlot(EquipmentSlot.Mainhand);
        if (item.getItem() != undefined &&
            item.getTags().includes("blockfinder_goggles")) {
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
    if (item.getTags().includes("allow_nightvision")) {
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
            build_lore(item);
        }
    })
        .catch((error) => {
        player.sendMessage("Failed to show form: " + error);
        return -1;
    });
}
function build_lore(item) {
    let options_string = item.getDynamicProperty("options");
    let ops = JSON.parse(options_string);
    let lore = [];
    if (ops.dd == true) {
        lore.push("§gDouble Distance: §aEnabled");
    }
    else {
        lore.push("§gDouble Distance: §8Disabled");
    }
    if (ops.effect == 1) {
        lore.push("§gEffect: §aTorch");
    }
    else if (ops.effect == 2) {
        lore.push("§gEffect: §aNight Vision");
    }
    else {
        lore.push("§gEffect: §8Disabled");
    }
    item.setLore(lore);
}
system.runInterval(() => {
    world.getPlayers().forEach((player) => {
        player.runCommand('execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=9]');
        player.runCommand("execute as @e[tag=night_vision] at @s run tag @s remove night_vision");
        let ops = getEquipmentOptions(player);
        if (JSON.stringify(ops) !== "{}") {
            Object.entries(ops).forEach((options) => {
                find_blocks(player, options.findblocks, options.dd);
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
    });
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
            item.getTags().includes("blockfinder_goggles")) {
            let name = String(item.typeId);
            let find_blocks = [];
            item.getTags().forEach((tag) => {
                if (tag.startsWith("findblock:")) {
                    find_blocks.push(tag.replace("findblock:", ""));
                }
            });
            let options = "";
            if (item.getDynamicProperty("options") != undefined) {
                options = item.getDynamicProperty("options");
            }
            Object.assign(ops, {
                [name]: {
                    ...{ slot: slot },
                    ...{ item: item },
                    ...{ findblocks: find_blocks },
                    ...Object(JSON.parse(options)),
                },
            });
        }
    });
    return ops;
}
function find_blocks(player, block_names, double_distance = false) {
    block_names.forEach((full_name) => {
        let n = full_name.split("_");
        let suffix = "";
        if (n[n.length - 1] == "ore" || n[n.length - 1] == "block") {
            suffix = String(n.pop());
        }
        let prefix = "";
        if (n.length > 1) {
            prefix = String(n.shift());
        }
        let name = n.join("_");
        if (prefix == "" && name.includes(":")) {
            ;
            [prefix, name] = name.split(":");
            prefix += ":";
        }
        let fill_array = ["~-15 ~-15 ~-15 ~15 ~15 ~15"];
        if (double_distance) {
            fill_array = [
                "~ ~ ~ ~30 ~30 ~30",
                "~ ~ ~ ~30 ~30 ~-30",
                "~ ~ ~ ~30 ~-30 ~30",
                "~ ~ ~ ~30 ~-30 ~-30",
                "~ ~ ~ ~-30 ~30 ~30",
                "~ ~ ~ ~-30 ~30 ~-30",
                "~ ~ ~ ~-30 ~-30 ~30",
                "~ ~ ~ ~-30 ~-30 ~-30",
            ];
        }
        fill_array.forEach((locs) => {
            player.runCommand(`execute as @s run fill ${locs} the_ore_finder_project:placeholder ["the_ore_finder_project:prefix"="${prefix}", "the_ore_finder_project:name"="${name}", "the_ore_finder_project:suffix"="${suffix}"] replace ${full_name}`);
            player.runCommand(`execute as @s run fill ${locs} ${full_name} replace the_ore_finder_project:placeholder ["the_ore_finder_project:prefix"="${prefix}", "the_ore_finder_project:name"="${name}", "the_ore_finder_project:suffix"="${suffix}"]`);
        });
        let tag_range = double_distance
            ? "x=~-30.5, dx=60, y=~-30.5, dy=60, z=~-30.5, dz=60"
            : "x=~-15.5, dx=30, y=~-15.5, dy=30, z=~-15.5, dz=30";
        player.runCommand(`execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=${full_name}, ${tag_range}] add visible`);
    });
}
world.beforeEvents.worldInitialize.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("the_ore_finder_project:ore_finder_component", {
        onPlace(arg) {
            let pos = arg.block.location;
            let the_name = arg.block.type.id;
            the_name = the_name.substring(the_name.indexOf(":") + 1);
            the_name = the_name.replace("minecraft:", "");
            the_name = the_name.replace("deepslate_", "");
            the_name = the_name.replace("nether_", "");
            the_name = the_name.replace("lit_", "");
            the_name = the_name.replace("raw_", "");
            the_name = the_name.replace("_block", "");
            the_name = the_name.replace("_ore", "");
            let entlist = arg.dimension.getEntitiesAtBlockLocation(pos);
            if (entlist.find((e) => e.typeId === "the_ore_finder_project:vanilla_indicator_entity") == undefined) {
                pos.x += 0.5;
                pos.y += 0.5;
                pos.z += 0.5;
                const ore = arg.dimension.spawnEntity("the_ore_finder_project:vanilla_indicator_entity", pos);
                ore.triggerEvent("the_ore_finder_project:" + the_name);
                ore.addTag("torp_entity");
                ore.addTag("visible");
                ore.addTag(arg.block.type.id);
            }
        },
    });
});
world.afterEvents.playerBreakBlock.subscribe((e) => {
    e.player.dimension.getEntitiesAtBlockLocation(e.block).forEach((ent) => {
        if (ent.typeId == "the_ore_finder_project:vanilla_indicator_entity") {
            ent.remove();
        }
    });
});
