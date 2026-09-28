# === CHECK PANZER ROUND ===
# Spawns one Panzer on the configured first round and interval, if this map has Panzer spawners.

execute unless entity @e[type=minecraft:marker,tag=panzer_spawner] run return 0
execute unless score #global wave.panzer_start_round matches 1.. run scoreboard players set #global wave.panzer_start_round 12
execute unless score #global wave.panzer_round_interval matches 1.. run scoreboard players set #global wave.panzer_round_interval 6
execute if score #global wave.round < #global wave.panzer_start_round run return 0

scoreboard players operation #panzer_round_mod temp = #global wave.round
scoreboard players operation #panzer_round_mod temp -= #global wave.panzer_start_round
scoreboard players operation #panzer_round_mod temp %= #global wave.panzer_round_interval

execute if score #panzer_round_mod temp matches 0 run function zombies:bosses/panzer/spawn/request
