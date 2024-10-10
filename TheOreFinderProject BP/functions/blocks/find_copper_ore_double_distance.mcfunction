# switch the ores with placeholders
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:copper_ore_placeholder replace copper_ore

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block


# switch the ores back
execute as @s run fill ~ ~ ~ ~30 ~30 ~30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 copper_ore replace the_ore_finder_project:copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 copper_ore replace the_ore_finder_project:copper_ore_placeholder

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 deepslate_copper_ore replace the_ore_finder_project:deepslate_copper_ore_placeholder

execute as @s run fill ~ ~ ~ ~30 ~30 ~30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~30 ~30 ~-30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~30 ~-30 ~-30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~30 ~-30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder
execute as @s run fill ~ ~ ~ ~-30 ~-30 ~-30 raw_copper_block replace the_ore_finder_project:raw_copper_block_placeholder


# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=copper_ore, x=~-30, dx=60, y=~-30, dy=60, z=~-30, dz=60] add visible
