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

#lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:redstone_ore_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore


# overworld
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:coal_ore_placeholder replace coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:coal_ore_placeholder replace coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_coal_ore_placeholder replace deepslate_coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_coal_ore_placeholder replace deepslate_coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore


# universal goggles
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:budding_amethyst_placeholder replace budding_amethyst
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:coal_ore_placeholder replace coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:coal_ore_placeholder replace coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_coal_ore_placeholder replace deepslate_coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_coal_ore_placeholder replace deepslate_coal_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:copper_ore_placeholder replace copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_copper_ore_placeholder replace deepslate_copper_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_copper_block_placeholder replace raw_copper_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:emerald_ore_placeholder replace emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_emerald_ore_placeholder replace deepslate_emerald_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:gold_ore_placeholder replace gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_gold_ore_placeholder replace deepslate_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_gold_block_placeholder replace raw_gold_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:iron_ore_placeholder replace iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_iron_ore_placeholder replace deepslate_iron_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:raw_iron_block_placeholder replace raw_iron_block
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lapis_ore_placeholder replace lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_lapis_ore_placeholder replace deepslate_lapis_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:redstone_ore_placeholder replace redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:deepslate_redstone_ore_placeholder replace deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_redstone_ore_placeholder replace lit_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:lit_deepslate_redstone_ore_placeholder replace lit_deepslate_redstone_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:ancient_debris_placeholder replace ancient_debris
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:nether_gold_ore_placeholder replace nether_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:nether_gold_ore_placeholder replace nether_gold_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:quartz_ore_placeholder replace quartz_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run fill ~15 ~15 ~15 ~-15 ~-15 ~-15 the_ore_finder_project:quartz_ore_placeholder replace quartz_ore



# reset the timer, 20 = 1 second, this will determine how often to do the ore swap, mainly just cuts down on lag
scoreboard players set @a[scores={Ticks=5..}] Ticks 0




# kill all the torp entities unless they have the visible tag
execute as @e[tag=torp_entity] at @s unless entity @s[tag=visible] run kill @s
# remove the visible tag from all that have it
execute as @e[tag=visible] at @s run tag @s remove visible

# tag the ancient debris entities visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:ancient_debris_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=ancient_debris, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:ancient_debris_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=ancient_debris, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# budding amethyst
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:budding_amethyst_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=budding_amethyst, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:budding_amethyst_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=budding_amethyst, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# coal
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:coal_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=coal_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:coal_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=coal_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# copper
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:copper_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=copper_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:copper_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=copper_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# diamond
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:diamond_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=diamond_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=diamond_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# emerald
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:emerald_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=emerald_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:emerald_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=emerald_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# gold
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:gold_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=gold_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:gold_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=gold_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# iron
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:iron_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=iron_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:iron_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=iron_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# lapis
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:lapis_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=lapis_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:lapis_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=lapis_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# quartz
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:quartz_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=quartz_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:quartz_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=quartz_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

# redstone
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:redstone_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=redstone_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:redstone_ore_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=redstone_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

#overworld
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=ancient_debris, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=ancient_debris, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=budding_amethyst, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=budding_amethyst, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=coal_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=coal_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=copper_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=copper_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=diamond_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=diamond_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=emerald_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=emerald_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=gold_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=gold_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=iron_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=iron_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=lapis_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=lapis_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=redstone_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, tag=redstone_ore, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible

#universal - don't need to see tag, as universal does ALL
execute as @a[hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:universal_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] at @s run tag @e[type=the_ore_finder_project:vanilla_indicator_entity, x=~-16, dx=31, y=~-16, dy=31, z=~-16, dz=31] add visible


# night vision
execute as @e[tag=night_vision] at @s run tag @s remove night_vision
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] run tag @s add night_vision
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] run tag @s add night_vision

#execute as @a at @s unless entity @s[tag=night_vision] run effect @s night_vision 0
effect @a[tag=night_vision] night_vision 30 0 true


# let there be light - still in work
execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=9]
execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:coal_ore_goggles, slot=0}] at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep
