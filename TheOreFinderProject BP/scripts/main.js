import { world } from "@minecraft/server";
world.beforeEvents.worldInitialize.subscribe((initEvent) => {
    initEvent.blockComponentRegistry.registerCustomComponent("the_ore_finder_project:ore_finder_component", {
        onPlace(arg) {
            let pos = arg.block.location;
            let previous_ore = arg.block.type.id;
            let the_name = arg.block.type.id;
            the_name = the_name.replace("the_ore_finder_project:", "");
            the_name = the_name.replace("_placeholder", "");
            the_name = the_name.replace("deepslate_", "");
            the_name = the_name.replace("nether_", "");
            the_name = the_name.replace("lit_", "");
            the_name = the_name.replace("raw_", "");
            the_name = the_name.replace("block", "ore");
            previous_ore = previous_ore.replace("_placeholder", "");
            previous_ore = previous_ore.replace("the_ore_finder_project:", "");
            arg.dimension.setBlockType(pos, previous_ore);
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
