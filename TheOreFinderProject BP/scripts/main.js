import { world, } from "@minecraft/server";
world.beforeEvents.worldInitialize.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("the_ore_finder_project:ore_finder_component", {
        onPlace(arg) {
            // we need to take the block name and rebuild it to the entity name
            // EX: the_ore_finder_project:deepslate_diamond_drop becomes the_ore_finder_project:diamond_ore_entity
            let placeholder_ore = arg.block.type.id;
            placeholder_ore = placeholder_ore.replace("placeholder", "entity");
            placeholder_ore = placeholder_ore.replace("deepslate_", "");
            const pos = arg.block.location;
            // I would love to find a way to summon an entity without using the runCommand, but this will work for now
            let entlist = arg.dimension.getEntitiesAtBlockLocation(pos);
            if (entlist.find((e) => e.typeId === "the_ore_finder_project:diamond_ore_entity") == undefined) {
                pos.x += 0.5;
                //pos.y += 0.5 // only uncomment this to make the placholder poke out the top of the ore, used for testing material
                pos.z += 0.5;
                arg.dimension.spawnEntity(placeholder_ore, pos);
            }
            // Switch the ore back
            let previous_ore = arg.block.type.id;
            previous_ore = previous_ore.replace("placeholder", "entity");
            previous_ore = previous_ore.replace("_entity", "");
            previous_ore = previous_ore.replace("the_ore_finder_project:", "");
            arg.dimension.setBlockType(pos, previous_ore);
        },
    });
});
