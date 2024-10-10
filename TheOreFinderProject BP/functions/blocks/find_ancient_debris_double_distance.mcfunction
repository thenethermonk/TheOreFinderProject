# switch the ores with placeholders
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris

# switch the ores back
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 ancient_debris replace the_ore_finder_project:ancient_debris_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=ancient_debris, x=~-30, dx=60, y=~-30, dy=60, z=~-30, dz=60] add visible
