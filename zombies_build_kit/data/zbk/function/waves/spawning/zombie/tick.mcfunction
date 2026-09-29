# Zombie-only dispatcher. At most one pending burst; no catch-up queue.
execute if score #global wave.spawn_delay_timer matches 1.. run scoreboard players remove #global wave.spawn_delay_timer 1
execute if score #global wave.spawn_delay_timer matches 1.. run return 0
execute if score #retry wz_state matches 1.. run scoreboard players remove #retry wz_state 1
execute if score #retry wz_state matches 1.. run return 0
execute unless score #pending wz_state matches 1 run function zbk:waves/spawning/zombie/pacing/burst_start
scoreboard players set #attempts wz_state 0
scoreboard players operation #attempt_limit wz_state = #global wave.burst_size
scoreboard players operation #attempt_limit wz_state *= #attempt_factor wz_cfg
execute store result score #now wz_state run time query gametime
function zbk:waves/spawning/zombie/selection/config
tag @e[type=marker,tag=wz_failed_pass] remove wz_failed_pass
function zbk:waves/spawning/zombie/pacing/burst
tag @e[type=marker,tag=wz_failed_pass] remove wz_failed_pass
execute if score #global wave.spawned >= #global wave.spawn_count run return run function zbk:waves/spawning/zombie/pacing/quota_complete
execute if score #global wave.burst_spawned >= #target wz_state run return run function zbk:waves/spawning/zombie/pacing/burst_complete
scoreboard players operation #retry wz_state = #retry_ticks wz_cfg
execute if entity @a[tag=debug,scores={debug_level=4..}] run tellraw @a[tag=debug,scores={debug_level=4..}] [{"text":"[WAVE] Pending burst successes "},{"score":{"name":"#global","objective":"wave.burst_spawned"}},{"text":" attempts "},{"score":{"name":"#attempts","objective":"wz_state"}},{"text":"; retrying after short delay"}]
