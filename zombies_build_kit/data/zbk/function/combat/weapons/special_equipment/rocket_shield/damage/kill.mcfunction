# Victim context. Direct health writes use the same explicit credit path as gun kills.
execute if entity @s[tag=combat_ignore] run return 0
execute if entity @s[tag=immune_melee] run return 0
execute if entity @s[tag=turned_zombie] run return 0
execute if entity @s[nbt={Invulnerable:1b}] run return 0
execute store result score #rs_victim_health temp run data get entity @s Health 100
execute if score #rs_victim_health temp matches ..0 run return 0
# No native player damage advancement: award exactly once, including overlapping sweeps.
data modify entity @s Health set value 0f
execute as @a if score @s id = #rs_basher temp run function zbk:player/points/add_kill_points
execute if entity @s[tag=crawler_ai] as @a if score @s id = #rs_basher temp run function zbk:dispatch/voice_event_crawler_kill
execute unless entity @s[tag=crawler_ai] as @a if score @s id = #rs_basher temp run function zbk:dispatch/voice_event_kill
scoreboard players operation #map_killer temp = #rs_basher temp
function zbk:enemy/killed
execute if entity @s[tag=crawler_ai] run function zbk:behavior/crawler/remove_paired_display
execute if entity @s[type=zombified_piglin] run loot spawn ~ ~ ~ loot entities/zombified_piglin
execute if entity @s[type=wolf] run loot spawn ~ ~ ~ loot entities/wolf
