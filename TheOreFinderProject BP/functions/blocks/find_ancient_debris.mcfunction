# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=ancient_debris, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

