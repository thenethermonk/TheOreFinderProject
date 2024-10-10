# switch the ores with placeholders
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst

# switch the ores back
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 budding_amethyst replace the_ore_finder_project:budding_amethyst_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=budding_amethyst, x=~-30, dx=60, y=~-30, dy=60, z=~-30, dz=60] add visible
