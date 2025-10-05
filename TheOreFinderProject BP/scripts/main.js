import { world, system, EquipmentSlot, } from "@minecraft/server";
import { ModalFormData } from "@minecraft/server-ui";
const MIN_DISTANCE = 2;
system.runInterval(() => {
    const players = world.getPlayers();
    if (players.length == 0)
        return;
    players.forEach((player) => {
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
        killEntitiesNearPlayer(player);
    });
    players[0].runCommand(`execute as @e[tag=torp_entity] at @s unless entity @s[tag=visible] run kill @s`);
    players[0].runCommand(`execute as @e[tag=torp_entity, tag=visible] at @s run tag @s remove visible`);
}, 4);
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
    let prevTagsRaw = p.getDynamicProperty(slot + "_tags");
    let prevTags = undefined;
    if (prevTagsRaw !== undefined) {
        try {
            prevTags = JSON.parse(prevTagsRaw);
        }
        catch {
            prevTags = undefined;
        }
    }
    let itemChanged = false;
    let block_name = undefined;
    if (detectItemChanged(p, slot)) {
        kill_all_indicators(p);
        if (prevTags != undefined) {
            prevTags.forEach((tag) => {
                if (tag.startsWith("findblock:")) {
                    let na = tag.replace("findblock:", "").split(":");
                    let color = na.shift();
                    block_name = tag.replace("findblock:", "").replace(color + ":", "");
                    p.setDynamicProperty(block_name + "_color", undefined);
                    p.setDynamicProperty(block_name + "_indicator", undefined);
                }
            });
        }
        itemChanged = true;
        p.setDynamicProperty(slot + "_tags", JSON.stringify(item.getTags()));
    }
    if (item.getItem() != undefined &&
        item.getTags().includes("the_ore_finder_project:goggles")) {
        let name = String(item.typeId);
        let find_blocks = [];
        let options_string = "{}";
        let options = {
            dd: false, effect: 1, indicator: 0, ores: {
                coal: true,
                copper: true,
                gold: true,
                iron: true,
                diamond: true,
                emerald: true,
                budding_amethyst: true,
                lapis: true,
                redstone: true,
                quartz: true,
                ancient_debris: true
            }
        };
        if (item.getDynamicProperty("options") != undefined) {
            options_string = item.getDynamicProperty("options");
            options = JSON.parse(options_string);
        }
        if (typeof options.indicator !== 'number' || options.indicator < 0 || options.indicator > 3) {
            options.indicator = 0;
        }
        if (typeof options.dd !== 'boolean') {
            if (options.dd == 1)
                options.dd = true;
            else
                options.dd = false;
        }
        if (typeof options.effect !== 'number' || options.effect < 0 || options.effect > 2) {
            options.effect = 1;
        }
        item.getTags().forEach((tag) => {
            if (tag.startsWith("findblock:")) {
                let na = tag.replace("findblock:", "").split(":");
                let color = na.shift();
                let block_name = tag.replace("findblock:", "").replace(color + ":", "");
                p.setDynamicProperty(block_name + "_color", color);
                switch (options.indicator) {
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
                let the_name = block_name;
                the_name = the_name.substring(the_name.indexOf(":") + 1);
                the_name = the_name.replace("minecraft:", "");
                the_name = the_name.replace("lit_", "");
                the_name = the_name.replace("deepslate_", "");
                the_name = the_name.replace("nether_", "");
                the_name = the_name.replace("raw_", "");
                the_name = the_name.replace("_block", "");
                the_name = the_name.replace("_ore", "");
                if (name == "the_ore_finder_project:overworld_goggles" || name == "the_ore_finder_project:universal_goggles") {
                    for (const [key, value] of Object.entries(options.ores)) {
                        if (key == the_name && value === true) {
                            find_blocks.push(block_name);
                        }
                    }
                }
                else {
                    find_blocks.push(block_name);
                }
            }
        });
        ops = {
            [name]: {
                ...{ slot: slot },
                ...{ item: item },
                ...{ findblocks: find_blocks },
                ...Object(options),
            },
        };
    }
    if (itemChanged) {
    }
    return ops;
}
world.afterEvents.playerLeave.subscribe((event) => {
    const p = world.getAllPlayers()[0];
    const entities = p.dimension.getEntities({
        location: p.location,
        minDistance: 30
    });
    for (const entity of entities) {
        if (entity.hasTag("torp_entity")) {
            entity.kill;
        }
    }
});
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
            let d = 15;
            if (double_distance) {
                d = 30;
            }
            let nY = -1 * d;
            if (player.location.y < -64 + d) {
                nY = -64 - player.location.y;
            }
            let fill_array = [
                `~ ~ ~ ~${d} ~${d} ~${d}`,
                `~ ~ ~ ~${d} ~${d} ~-${d}`,
                `~ ~ ~ ~${d} ~${nY} ~${d}`,
                `~ ~ ~ ~${d} ~${nY} ~-${d}`,
                `~ ~ ~ ~-${d} ~${d} ~${d}`,
                `~ ~ ~ ~-${d} ~${d} ~-${d}`,
                `~ ~ ~ ~-${d} ~${nY} ~${d}`,
                `~ ~ ~ ~-${d} ~${nY} ~-${d}`,
            ];
            fill_array.forEach((locs) => {
                player.runCommand(`execute as @s run fill ${locs} the_ore_finder_project:placeholder ["the_ore_finder_project:prefix"="${prefix}", "the_ore_finder_project:name"="${name}", "the_ore_finder_project:suffix"="${suffix}"] replace ${full_name}`);
                player.runCommand(`execute as @s run fill ${locs} ${full_name} replace the_ore_finder_project:placeholder ["the_ore_finder_project:prefix"="${prefix}", "the_ore_finder_project:name"="${name}", "the_ore_finder_project:suffix"="${suffix}"]`);
            });
            let tag_range_array = [
                `x=~, dx=${d}, y=~, dy=${d}, z=~, dz=${d}`,
                `x=~, dx=${d}, y=~, dy=${d}, z=~, dz=-${d}`,
                `x=~, dx=${d}, y=~, dy=-${d}, z=~, dz=${d}`,
                `x=~, dx=${d}, y=~, dy=-${d}, z=~, dz=-${d}`,
                `x=~, dx=-${d}, y=~, dy=${d}, z=~, dz=${d}`,
                `x=~, dx=-${d}, y=~, dy=${d}, z=~, dz=-${d}`,
                `x=~, dx=-${d}, y=~, dy=-${d}, z=~, dz=${d}`,
                `x=~, dx=-${d}, y=~, dy=-${d}, z=~, dz=-${d}`,
            ];
            tag_range_array.forEach((tag_range) => {
                player.runCommand(`execute as @s run tag @e[tag=torp_entity, tag=${full_name}, ${tag_range}] add visible`);
            });
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
    let options = {
        dd: false, effect: 1, indicator: 0, ores: {
            coal: true,
            copper: true,
            gold: true,
            iron: true,
            diamond: true,
            emerald: true,
            budding_amethyst: true,
            lapis: true,
            redstone: true,
            quartz: true,
            ancient_debris: true
        }
    };
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
    if (typeof options.indicator !== 'number' || options.indicator < 0 || options.indicator > 3) {
        options.indicator = 0;
    }
    if (typeof options.dd !== 'boolean') {
        if (options.dd == 1)
            options.dd = true;
        else
            options.dd = false;
    }
    if (typeof options.effect !== 'number' || options.effect < 0 || options.effect > 2) {
        options.effect = 1;
    }
    const modalForm = new ModalFormData();
    modalForm.title({
        translate: item.typeId + "_options",
    });
    if (player.graphicsMode != "Deferred") {
        modalForm.label("                §4Glow disabled\n§6To enable glow, §fSave & Quit§6. Then\nset §fSettings§6 > §fVideo§6 >§f Graphics Mode§6 to §fVibrant Visuals§6");
        modalForm.divider();
    }
    modalForm.dropdown("\nEffect (When worn on head)", effects, { defaultValueIndex: options.effect });
    modalForm.dropdown("Indicator Type", indicators, { defaultValueIndex: options.indicator });
    modalForm.toggle("Double Distance", { defaultValue: options.dd });
    if (item.typeId == "the_ore_finder_project:overworld_goggles" || item.typeId == "the_ore_finder_project:universal_goggles") {
        modalForm.divider();
        modalForm.label("Find Ores§6");
        modalForm.toggle("§8Coal Ore§6", { defaultValue: options.ores.coal });
        modalForm.toggle("§nCopper Ore§6", { defaultValue: options.ores.copper });
        modalForm.toggle("§pGold Ore§6", { defaultValue: options.ores.gold });
        modalForm.toggle("§iIron Ore§6", { defaultValue: options.ores.iron });
        modalForm.toggle("§sDiamond Ore§6", { defaultValue: options.ores.diamond });
        modalForm.toggle("§qEmerald Ore§6", { defaultValue: options.ores.emerald });
        modalForm.toggle("§uBudding Amethyst§6", { defaultValue: options.ores.budding_amethyst });
        modalForm.toggle("§tLapis Lazuli§6", { defaultValue: options.ores.lapis });
        modalForm.toggle("§mRedstone§6", { defaultValue: options.ores.redstone });
    }
    if (item.typeId == "the_ore_finder_project:universal_goggles") {
        modalForm.toggle("§hQuartz§6", { defaultValue: options.ores.quartz });
        modalForm.toggle("§jAncient Debris§6", { defaultValue: options.ores.ancient_debris });
    }
    let start = 0;
    if (player.graphicsMode != "Deferred") {
        start = 2;
    }
    modalForm.divider();
    modalForm.submitButton("Save Options");
    modalForm
        .show(player)
        .then((formData) => {
        if (formData.formValues) {
            let saveOptions = {
                dd: formData.formValues[start + 2],
                effect: formData.formValues[start],
                indicator: formData.formValues[start + 1],
                ores: {}
            };
            if (item.typeId == "the_ore_finder_project:overworld_goggles" || item.typeId == "the_ore_finder_project:universal_goggles") {
                saveOptions = {
                    ...saveOptions,
                    ores: {
                        coal: formData.formValues[start + 5],
                        copper: formData.formValues[start + 6],
                        gold: formData.formValues[start + 7],
                        iron: formData.formValues[start + 8],
                        diamond: formData.formValues[start + 9],
                        emerald: formData.formValues[start + 10],
                        budding_amethyst: formData.formValues[start + 11],
                        lapis: formData.formValues[start + 12],
                        redstone: formData.formValues[start + 13],
                    }
                };
            }
            if (item.typeId == "the_ore_finder_project:universal_goggles") {
                saveOptions = {
                    ...saveOptions,
                    ores: {
                        ...saveOptions.ores,
                        quartz: formData.formValues[start + 14],
                        ancient_debris: formData.formValues[start + 15],
                    }
                };
            }
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
            let players = world.getPlayers().filter(p => p.getDynamicProperty(the_name + "_color") !== undefined);
            const playersWithDistance = players.map(player => ({
                player: player,
                distance: calculateDistance(player.location, pos)
            }));
            playersWithDistance.sort((a, b) => a.distance - b.distance);
            players = playersWithDistance.map(item => item.player);
            if (players[0] == undefined) {
                return false;
            }
            let p = players[0];
            const the_color = p.getDynamicProperty(the_name + "_color");
            const the_indicator = p.getDynamicProperty(the_name + "_indicator");
            the_name = the_name.substring(the_name.indexOf(":") + 1);
            the_name = the_name.replace("minecraft:", "");
            the_name = the_name.replace("lit_", "");
            let block_name = the_name;
            the_name = the_name.replace("deepslate_", "");
            the_name = the_name.replace("nether_", "");
            the_name = the_name.replace("raw_", "");
            the_name = the_name.replace("_block", "");
            the_name = the_name.replace("_ore", "");
            let entTypeId = "the_ore_finder_project:" + the_indicator + "_indicator_entity";
            let entlist = arg.dimension.getEntitiesAtBlockLocation(pos);
            let ent = entlist.find((e) => e.hasTag("torp_entity"));
            if (ent !== undefined) {
                if (ent.typeId != entTypeId) {
                    ent.kill();
                    ent = undefined;
                }
            }
            if (ent === undefined) {
                pos.x += 0.5;
                pos.y += 0.5;
                pos.z += 0.5;
                const dist = distanceFromPlayer(p, pos);
                if (dist > MIN_DISTANCE) {
                    const ore = arg.dimension.spawnEntity(entTypeId, pos);
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
    p.runCommand(`execute as @e[tag=torp_entity] at @s run kill @s`);
}
function killEntitiesNearPlayer(player) {
    const entities = player.dimension.getEntities({ tags: ["torp_entity"] });
    entities.forEach((ent) => {
        const dist = distanceFromPlayer(player, ent.location);
        if (dist <= MIN_DISTANCE) {
            ent.kill();
        }
    });
}
function distanceFromPlayer(p, loc) {
    const dx = loc.x - p.location.x;
    const dy = loc.y - p.location.y - 1.62;
    const dz = loc.z - p.location.z;
    const dist = Math.ceil(Math.sqrt(dx * dx + dy * dy + dz * dz));
    return dist;
}
function calculateDistance(pos1, pos2) {
    const dx = pos1.x - pos2.x;
    const dy = pos1.y - pos2.y;
    const dz = pos1.z - pos2.z;
    return Math.sqrt(dx * dx + dy * dy + dz * dz);
}
function showPlayerDynamicProperties(player) {
    const names = player.getDynamicPropertyIds();
    if (names.length === 0) {
        world.sendMessage("You have no dynamic properties set.");
        return;
    }
    names.forEach(name => {
        const value = player.getDynamicProperty(name);
        player.sendMessage(`${name}: ${JSON.stringify(value)}`);
    });
}
