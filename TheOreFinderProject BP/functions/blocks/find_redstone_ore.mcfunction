# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 redstone_ore replace the_ore_finder_project:redstone_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 deepslate_redstone_ore replace the_ore_finder_project:deepslate_redstone_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 lit_redstone_ore replace the_ore_finder_project:lit_redstone_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 lit_deepslate_redstone_ore replace the_ore_finder_project:lit_deepslate_redstone_ore_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=redstone_ore, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

