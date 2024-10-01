import { world } from "@minecraft/server";
world.beforeEvents.worldInitialize.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("the_ore_finder_project:ore_finder_component", {
        onPlace(arg) {
            let pos = arg.block.location;
            let entity_variant = arg.block.type.id;
            let previous_ore = arg.block.type.id;
            let just_the_name = arg.block.type.id;
            just_the_name = just_the_name.replace("the_ore_finder_project:", "");
            just_the_name = just_the_name.replace("_placeholder", "");
            just_the_name = just_the_name.replace("deepslate_", "");
            just_the_name = just_the_name.replace("nether_", "");
            just_the_name = just_the_name.replace("lit_", "");
            just_the_name = just_the_name.replace("raw_", "");
            just_the_name = just_the_name.replace("block", "ore");
            previous_ore = previous_ore.replace("_placeholder", "");
            previous_ore = previous_ore.replace("the_ore_finder_project:", "");
            arg.dimension.setBlockType(pos, previous_ore);
            let entlist = arg.dimension.getEntitiesAtBlockLocation(pos);
            if (entlist.find((e) => e.typeId === "the_ore_finder_project:vanilla_indicator_entity") == undefined) {
                pos.x += 0.5;
                pos.z += 0.5;
                const ore = arg.dimension.spawnEntity("the_ore_finder_project:vanilla_indicator_entity", pos);
                ore.triggerEvent("the_ore_finder_project:" + just_the_name);
                ore.addTag("torp_entity");
                ore.addTag("visible");
                ore.addTag(just_the_name);
            }
        },
    });
});
