# switch the ores with placeholders

execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:nether_gold_ore_placeholder replace nether_gold_ore

# switch the ores back
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 gold_ore replace the_ore_finder_project:gold_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 deepslate_gold_ore replace the_ore_finder_project:deepslate_gold_ore_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 raw_gold_block replace the_ore_finder_project:raw_gold_block_placeholder
execute as @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 nether_gold_ore replace the_ore_finder_project:nether_gold_ore_placeholder

# tag the entities visible
execute as @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=gold_ore, x=~-15, dx=31, y=~-15, dy=31, z=~-15, dz=31] add visible

