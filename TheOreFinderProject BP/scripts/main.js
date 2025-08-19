import { world, system, EquipmentSlot, } from "@minecraft/server";
import { ModalFormData } from "@minecraft/server-ui";
system.runInterval(() => {
    world.getPlayers().forEach((player) => {
        player.runCommand('execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=9]');
        player.runCommand("execute as @e[tag=night_vision] at @s run tag @s remove night_vision");
        let ops = getAllEquipmentOptions(player);
        if (JSON.stringify(ops) !== "{}") {
            Object.entries(ops).forEach(([name, options]) => {
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
function getAllEquipmentOptions(p) {
    let ops = {};
    let slots = [
        EquipmentSlot.Mainhand,
        EquipmentSlot.Offhand,
        EquipmentSlot.Head,
    ];
    slots.forEach((slot) => {
        let slot_ops = getEquipmentOptions(p, slot);
        Object.assign(ops, slot_ops);
    });
    return ops;
}
function getEquipmentOptions(p, slot) {
    let ops = {};
    let equippable = p.getComponent("equippable");
    let item = equippable?.getEquipmentSlot(slot);
    if (detectItemChanged(p, slot)) {
        kill_all_indicators(p);
    }
    if (item.getItem() != undefined &&
        item.getTags().includes("the_ore_finder_project:goggles")) {
        let name = String(item.typeId);
        let find_blocks = [];
        let options = "{}";
        if (item.getDynamicProperty("options") != undefined) {
            options = item.getDynamicProperty("options");
        }
        item.getTags().forEach((tag) => {
            if (tag.startsWith("findblock:")) {
                let na = tag.replace("findblock:", "").split(":");
                let color = na.shift();
                let block_name = tag.replace("findblock:", "").replace(color + ":", "");
                p.setDynamicProperty(block_name + "_color", color);
                switch (JSON.parse(options).indicator) {
                    case 1: {
                        p.setDynamicProperty(block_name + "_indicator", "orb");
                        break;
                    }
                    case 2: {
                        p.setDynamicProperty(block_name + "_indicator", "outline");
                        break;
                    }
                    case 3: {
                        p.setDynamicProperty(block_name + "_indicator", "ore");
                        break;
                    }
                    default: {
                        p.setDynamicProperty(block_name + "_indicator", "box");
                        break;
                    }
                }
                find_blocks.push(block_name);
            }
        });
        ops = {
            [name]: {
                ...{ slot: slot },
                ...{ item: item },
                ...{ findblocks: find_blocks },
                ...Object(JSON.parse(options)),
            },
        };
    }
    return ops;
}
function find_blocks(player, block_names, double_distance = false) {
    if (block_names !== undefined) {
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
            let negY = -15;
            if (player.location.y < -49) {
                negY = -64 - player.location.y;
            }
            let fill_array = ["~-15 ~" + negY + " ~-15 ~15 ~15 ~15"];
            if (double_distance) {
                let negY = -30;
                if (player.location.y < -34) {
                    negY = -64 - player.location.y;
                }
                fill_array = [
                    "~ ~ ~ ~30 ~30 ~30",
                    "~ ~ ~ ~30 ~30 ~-30",
                    "~ ~ ~ ~30 ~" + negY + " ~30",
                    "~ ~ ~ ~30 ~" + negY + " ~-30",
                    "~ ~ ~ ~-30 ~30 ~30",
                    "~ ~ ~ ~-30 ~30 ~-30",
                    "~ ~ ~ ~-30 ~" + negY + " ~30",
                    "~ ~ ~ ~-30 ~" + negY + " ~-30",
                ];
            }
            fill_array.forEach((locs) => {
                player.runCommand(`execute as @s run fill ${locs} the_ore_finder_project:placeholder ["the_ore_finder_project:prefix"="${prefix}", "the_ore_finder_project:name"="${name}", "the_ore_finder_project:suffix"="${suffix}"] replace ${full_name}`);
                player.runCommand(`execute as @s run fill ${locs} ${full_name} replace the_ore_finder_project:placeholder ["the_ore_finder_project:prefix"="${prefix}", "the_ore_finder_project:name"="${name}", "the_ore_finder_project:suffix"="${suffix}"]`);
            });
            let tag_range = double_distance
                ? "x=~-30.5, dx=60, y=~-30.5, dy=60, z=~-30.5, dz=60"
                : "x=~-15.5, dx=30, y=~-15.5, dy=30, z=~-15.5, dz=30";
            player.runCommand(`execute as @s run tag @e[tag=torp_entity, tag=${full_name}, ${tag_range}] add visible`);
        });
    }
}
world.beforeEvents.itemUse.subscribe((e) => {
    const { source, itemStack } = e;
    if (source.isSneaking) {
        let equippable = source.getComponent("equippable");
        const item = equippable?.getEquipmentSlot(EquipmentSlot.Mainhand);
        if (item.getItem() != undefined &&
            item.getTags().includes("the_ore_finder_project:goggles")) {
            e.cancel = true;
            system.run(() => {
                showGoggleOptions(source, item);
            });
        }
    }
});
function showGoggleOptions(player, item) {
    let options = { dd: false, effect: 1, indicator: 0 };
    let effects = ["None", "Dynamic Torch"];
    let indicators = ["Box", "Orb", "Outline", "Ore"];
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
    if (player.graphicsMode != "Deferred") {
        modalForm.label("                §4Glow disabled\n§6To enable glow, §fSave & Quit§6. Then\nset §fSettings§6 > §fVideo§6 >§f Graphics Mode§6 to §fVibrant Visuals§6");
        modalForm.divider();
    }
    modalForm.dropdown("\nEffect (When worn on head)", effects, { defaultValueIndex: options.effect });
    modalForm.dropdown("Indicator Type", indicators, { defaultValueIndex: options.indicator });
    modalForm.toggle("Double Distance", { defaultValue: options.dd });
    modalForm.submitButton("Save Options");
    modalForm
        .show(player)
        .then((formData) => {
        if (formData.formValues) {
            let saveOptions = {
                dd: formData.formValues[2],
                effect: formData.formValues[0],
                indicator: formData.formValues[1],
            };
            item.setDynamicProperty("options", JSON.stringify(saveOptions));
            build_lore(item);
        }
        kill_all_indicators(player);
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
    if (ops.indicator == 1) {
        lore.push("§gIndicator: §aOrb");
    }
    else if (ops.effect == 2) {
        lore.push("§gIndicator: §aOutline");
    }
    else if (ops.effect == 3) {
        lore.push("§gIndicator: §aOre");
    }
    else {
        lore.push("§gIndicator: §aBox");
    }
    item.setLore(lore);
}
system.beforeEvents.startup.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("the_ore_finder_project:ore_finder_component", {
        onPlace(arg) {
            let pos = arg.block.location;
            let tags = arg.block.getTags();
            let the_name = arg.block.type.id;
            let p = getClosestPlayer(pos);
            let the_color = p.getDynamicProperty(the_name + "_color");
            let the_indicator = p.getDynamicProperty(the_name + "_indicator");
            the_name = the_name.substring(the_name.indexOf(":") + 1);
            the_name = the_name.replace("minecraft:", "");
            the_name = the_name.replace("lit_", "");
            let block_name = the_name;
            the_name = the_name.replace("deepslate_", "");
            the_name = the_name.replace("nether_", "");
            the_name = the_name.replace("raw_", "");
            the_name = the_name.replace("_block", "");
            the_name = the_name.replace("_ore", "");
            let entlist = arg.dimension.getEntitiesAtBlockLocation(pos);
            if (entlist.find((e) => e.hasTag("torp_entity")) == undefined) {
                pos.x += 0.5;
                pos.y += 0.5;
                pos.z += 0.5;
                const ore = arg.dimension.spawnEntity("the_ore_finder_project:" + the_indicator + "_indicator_entity", pos);
                if (the_indicator == 'ore') {
                    ore.triggerEvent("the_ore_finder_project:" + block_name);
                }
                else {
                    ore.triggerEvent("the_ore_finder_project:" + the_color);
                }
                ore.addTag("torp_entity");
                ore.addTag("visible");
                ore.addTag(arg.block.type.id);
            }
        },
    });
});
function getClosestPlayer(loc) {
    let dis = 0;
    let player = undefined;
    world.getPlayers().forEach((p) => {
        const dx = p.location.x - loc.x;
        const dy = p.location.y - loc.y;
        const dz = p.location.z - loc.z;
        let d = Math.sqrt(dx * dx + dy * dy + dz * dz);
        if (d > dis) {
            dis = d;
            player = p;
        }
    });
    if (player == undefined) {
        return world.getPlayers()[0];
    }
    else {
        return player;
    }
}
world.afterEvents.playerBreakBlock.subscribe((e) => {
    e.player.dimension.getEntitiesAtBlockLocation(e.block).forEach((ent) => {
        if (ent.getTags().includes("torp_entity")) {
            ent.remove();
        }
    });
});
function detectItemChanged(p, slot) {
    let equippable = p.getComponent("equippable");
    let item = equippable?.getEquipmentSlot(slot);
    if (item.getItem() == undefined) {
        p.setDynamicProperty(slot, undefined);
    }
    else if (p.getDynamicProperty(slot) != item.typeId) {
        p.setDynamicProperty(slot, item.typeId);
        return true;
    }
    return false;
}
function kill_all_indicators(p) {
    p.runCommand("execute as @e[tag=torp_entity] at @s run kill @s");
}
