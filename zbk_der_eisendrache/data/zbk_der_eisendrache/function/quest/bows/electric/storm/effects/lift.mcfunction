# Capture once from the ground; #current de_storm_link identifies the catching storm.
execute unless score #active zbk.de matches 1 run return 0
execute if entity @s[tag=zbk.enemy_stunned] run return 0
execute unless entity @s[nbt={OnGround:1b}] run return 0
execute if data entity @s active_effects[{id:"minecraft:levitation"}] run return 0

scoreboard players operation @s de_storm_link = #current de_storm_link
scoreboard players set @s de_storm_life 20
execute if entity @s[nbt={NoAI:1b}] run tag @s add de_storm_restore_no_ai
execute if entity @s[nbt={NoGravity:1b}] run tag @s add de_storm_restore_no_gravity
tag @s add zbk.enemy_stunned
data merge entity @s {NoAI:1b,NoGravity:1b,Motion:[0.0d,0.0d,0.0d],fall_distance:0.0f}
execute if entity @s[type=iron_golem,tag=panzer_ai] run function zbk:api/bosses/panzer/attacks/shared/stun
