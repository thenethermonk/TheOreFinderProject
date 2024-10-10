# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 emerald_ore replace the_ore_finder_project:emerald_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 deepslate_emerald_ore replace the_ore_finder_project:deepslate_emerald_ore_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=emerald_ore, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

