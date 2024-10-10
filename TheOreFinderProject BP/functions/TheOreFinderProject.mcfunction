# night vision
execute as @e[tag=night_vision] at @s run tag @s remove night_vision
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] run tag @s add night_vision
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] run tag @s add night_vision
execute as @a[tag=night_vision] run effect @s night_vision 30 0 true

# ok, to get rid of night vision without breaking it for everyone we need to use an extra tag
execute as @e[tag=night_vision] run tag @s add had_night_vision
execute as @a[tag=had_night_vision] at @s unless entity @s[tag=night_vision] run effect @s night_vision 0
execute as @a[tag=had_night_vision] at @s unless entity @s[tag=night_vision] run tag @s remove had_night_vision

# let there be light - still in work
execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=9]
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:ancient_debris_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:budding_amethyst_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:coal_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:copper_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:emerald_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:gold_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:iron_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:lapis_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:redstone_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:quartz_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
