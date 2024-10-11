# night vision
#execute as @e[tag=night_vision] at @s run tag @s remove night_vision
#execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:overworld_goggles}] run tag @s add night_vision
#execute as @a[hasitem={location=slot.armor.head, item=the_ore_finder_project:universal_goggles}] run tag @s add night_vision
#execute as @a[tag=night_vision] run effect @s night_vision 30 0 true

# ok, to get rid of night vision without breaking it for everyone we need to use an extra tag
execute as @e[tag=night_vision] run tag @s add had_night_vision
execute as @a[tag=had_night_vision] at @s unless entity @s[tag=night_vision] run effect @s night_vision 0
execute as @a[tag=had_night_vision] at @s unless entity @s[tag=night_vision] run tag @s remove had_night_vision
