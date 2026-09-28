execute if score #global wave.burst_spawned >= #target wz_state run return 0
execute if score #global wave.spawned >= #global wave.spawn_count run return 0
execute if score #attempts wz_state >= #attempt_limit wz_state run return 0
execute store result score #alive wz_state if entity @e[tag=wave_enemy]
execute if score #alive wz_state >= #global wave.max_alive run return 0
scoreboard players operation #attempt_before wz_state = #attempts wz_state
function zbk:waves/spawning/zombie/spawn
# No candidate across all players: end this pass instead of spinning.
execute if score #attempts wz_state = #attempt_before wz_state run return 0
return run function zbk:waves/spawning/zombie/burst
