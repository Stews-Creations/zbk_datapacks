execute if score #attempts wz_state >= #attempt_limit wz_state run return 0
scoreboard players add #attempts wz_state 1
execute if score #global wave.spawned >= #global wave.spawn_count run return 0
execute store result score #alive wz_state if entity @e[tag=wave_enemy]
execute if score #alive wz_state >= #global wave.max_alive run return 0
execute store result score #valid wz_state run function zombies:waves/spawning/zombie/selection/valid
execute unless score #valid wz_state matches 1 run return run tag @s add wz_failed_pass
execute store result score #success wz_state run function zombies:waves/spawning/zombie/creation/create
scoreboard players set #failure_reason wz_state 1
execute unless score #success wz_state matches 1 run function zombies:waves/spawning/zombie/animation/marker_failure
execute unless score #success wz_state matches 1 run return run tag @s add wz_failed_pass
execute as @e[tag=wz_created,limit=1] run function zombies:waves/spawning/zombie/accounting/commit
tag @e[tag=wz_created] remove wz_created
tag @s add wz_used
scoreboard players operation @s wz_recent = #now wz_state
execute if entity @s[nbt={data:{mode:0}}] run scoreboard players reset @s wz_failures
execute if entity @a[tag=debug,scores={debug_level=4..}] run function zombies:waves/spawning/zombie/selection/report
