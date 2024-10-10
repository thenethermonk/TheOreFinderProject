# switch the ores with placeholders
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:iron_ore_placeholder replace iron_ore

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block


# switch the ores back
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 iron_ore replace the_ore_finder_project:iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 iron_ore replace the_ore_finder_project:iron_ore_placeholder

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 deepslate_iron_ore replace the_ore_finder_project:deepslate_iron_ore_placeholder

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 raw_iron_block replace the_ore_finder_project:raw_iron_block_placeholder


# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=iron_ore, x=~-30, dx=60, y=~-30, dy=60, z=~-30, dz=60] add visible
