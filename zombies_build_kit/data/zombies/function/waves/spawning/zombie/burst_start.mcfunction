scoreboard players set #pending wz_state 1
scoreboard players set #global wave.burst_spawned 0
scoreboard players operation #target wz_state = #global wave.spawn_count
scoreboard players operation #target wz_state -= #global wave.spawned
scoreboard players operation #target wz_state < #global wave.burst_size
tag @e[type=marker,tag=wz_used] remove wz_used
