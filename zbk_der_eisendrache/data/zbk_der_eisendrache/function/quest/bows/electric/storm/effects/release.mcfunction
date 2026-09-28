# Restore the AI/gravity flags from capture, including on cleanup and orphan recovery.
execute unless entity @s[tag=zbk.enemy_stunned] run return 0
data merge entity @s {NoAI:0b,NoGravity:0b,Motion:[0.0d,0.0d,0.0d],fall_distance:0.0f}
execute if entity @s[tag=de_storm_restore_no_ai] run data modify entity @s NoAI set value 1b
execute if entity @s[tag=de_storm_restore_no_gravity] run data modify entity @s NoGravity set value 1b
effect give @s minecraft:slow_falling 3 0 true
tag @s remove zbk.enemy_stunned
tag @s remove de_storm_restore_no_ai
tag @s remove de_storm_restore_no_gravity
scoreboard players reset @s de_storm_link
scoreboard players reset @s de_storm_life
execute if entity @s[type=iron_golem,tag=panzer_ai,tag=!panzer_dying] unless entity @s[nbt={Health:0.0f}] run function zbk:api/bosses/panzer/model/animations/paired/walk
