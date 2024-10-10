# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=copper_ore, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

