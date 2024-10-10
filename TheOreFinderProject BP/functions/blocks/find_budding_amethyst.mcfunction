# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=budding_amethyst, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

