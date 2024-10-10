# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 lapis_ore replace the_ore_finder_project:lapis_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 deepslate_lapis_ore replace the_ore_finder_project:deepslate_lapis_ore_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=lapis_ore, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

