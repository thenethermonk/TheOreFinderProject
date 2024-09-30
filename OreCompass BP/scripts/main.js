import { world } from "@minecraft/server";
world.beforeEvents.worldInitialize.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("tofp:ore_finder_component", {
        onPlace(arg) {
            // we need to take the block name and rebuild it to the entity name
            // EX: tofp:deepslate_diamond_drop becomes tofp:diamond_entity
            let ore = arg.block.type.id;
            ore = ore.replace("finder", "entity");
            const pos = arg.block.location;
            // I would love to find a way to summon an entity without using the runCommand, but this will work for now
            arg.dimension.runCommand("summon " + ore + " " + pos.x + " " + pos.y + " " + pos.z + " ");
            ore = ore.replace("_entity", "");
            ore = ore.replace("tofp:", "");
            arg.dimension.setBlockType(pos, ore);
        },
    });
    initEvent.blockComponentRegistry.registerCustomComponent("tofp:ore_block_component", {
        onTick(arg) {
            // we need to take the block name and rebuild it to the standard name
            // EX: tofp:diamond_drop becomes diamond_ore
            let ore = arg.block.type.id;
            ore = ore.replace("drop", "ore");
            ore = ore.replace("tofp:", "");
            arg.dimension.setBlockType(arg.block.location, ore);
        },
        onPlace(arg) {
            // we need to take the block name and rebuild it to the entity name
            // EX: tofp:deepslate_diamond_drop becomes tofp:diamond_entity
            let ore = arg.block.type.id;
            ore = ore.replace("drop", "entity");
            ore = ore.replace("deepslate_", "");
            ore = ore.replace("nether_", "");
            const pos = arg.block.location;
            // I would love to find a way to summon an entity without using the runCommand, but this will work for now
            arg.dimension.runCommand("summon " + ore + " " + pos.x + " " + pos.y + " " + pos.z + " ");
        },
    });
});
