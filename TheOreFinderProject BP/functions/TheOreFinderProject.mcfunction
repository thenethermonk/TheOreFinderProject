# setup the timer
scoreboard objectives add Ticks dummy
scoreboard players add @a Ticks 1

# show timer on screen, used for debugging timer
#titleraw @a actionbar {"rawtext":[{"text":"Ticks: "},{"score":{"name":"*","objective":"Ticks"}}]}



# ancient debris
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:ancient_debris_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:ancient_debris_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris

# budding amethyst
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:budding_amethyst_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:budding_amethyst_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst

# coal
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:coal_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:coal_ore_placeholder replace coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:coal_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:coal_ore_placeholder replace coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:coal_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_coal_ore_placeholder replace deepslate_coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:coal_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_coal_ore_placeholder replace deepslate_coal_ore

# copper
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:copper_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:copper_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:copper_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:copper_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:copper_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:copper_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block

# diamond
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore

# emerald
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:emerald_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:emerald_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:emerald_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:emerald_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore

# gold
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:nether_gold_ore_placeholder replace nether_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:gold_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:nether_gold_ore_placeholder replace nether_gold_ore

# iron
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:iron_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:iron_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:iron_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:iron_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:iron_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:iron_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block

# lapis
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:lapis_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:lapis_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:lapis_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:lapis_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore

# quartz
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:quartz_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:quartz_ore_placeholder replace quartz_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:quartz_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:quartz_ore_placeholder replace quartz_ore

#redstone
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore




# reset the timer, 20 = 1 second, this will determine how often to do the ore swap, mainly just cuts down on lag
scoreboard players set @a[scores={Ticks=20..}] Ticks 0






#let there be light
#execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=13]
#execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
