# Runs as the confirmed new entity; exactly one refundable round slot.
execute if entity @s[tag=wz_slot] run return 0
tag @s add wz_slot
scoreboard players add #global wave.spawned 1
scoreboard players add #global wave.burst_spawned 1
execute if entity @s[type=zombified_piglin] run function zbk:behavior/ai/apply_stats
return 1
