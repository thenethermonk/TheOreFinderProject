# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 diamond_ore replace the_ore_finder_project:diamond_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 deepslate_diamond_ore replace the_ore_finder_project:deepslate_diamond_ore_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=diamond_ore, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

