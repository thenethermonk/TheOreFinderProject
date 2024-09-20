# setup the timer
scoreboard objectives add Ticks dummy
scoreboard players add @a Ticks 1

# show timer on screen, used for debugging timer
#titleraw @a actionbar {"rawtext":[{"text":"Ticks: "},{"score":{"name":"*","objective":"Ticks"}}]}




execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~12 ~12 ~12 ~-12 ~-12 ~-12 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~12 ~12 ~12 ~-12 ~-12 ~-12 the_ore_finder_project:diamond_ore_placeholder replace diamond_ore

execute as @a[scores={Ticks=1}, hasitem={location=slot.weapon.mainhand, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~12 ~12 ~12 ~-12 ~-12 ~-12 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore
execute as @a[scores={Ticks=1}, hasitem={location=slot.armor.head, item=the_ore_finder_project:diamond_ore_goggles}] at @s run fill ~12 ~12 ~12 ~-12 ~-12 ~-12 the_ore_finder_project:deepslate_diamond_ore_placeholder replace deepslate_diamond_ore






# reset the timer, 20 = 1 second, this will determine how often to do the ore swap, mainly just cuts down on lag
scoreboard players set @a[scores={Ticks=20..}] Ticks 0
