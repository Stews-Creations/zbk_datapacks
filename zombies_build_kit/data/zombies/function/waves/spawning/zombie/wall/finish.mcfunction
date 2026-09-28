# Confirm a live mannequin and usable two-block exit before conversion.
execute store result score #health wz_state run data get entity @s Health 100
execute if score #health wz_state matches ..0 run return run function zombies:waves/spawning/zombie/discard_mannequin
scoreboard players set #failure_reason wz_state 4
execute unless block ~ ~ ~ #zombies:spawn_exit_passable run return run function zombies:waves/spawning/zombie/animation/fail
execute unless block ~ ~1 ~ #zombies:spawn_exit_passable run return run function zombies:waves/spawning/zombie/animation/fail
tag @e[type=mannequin,tag=wz_converting] remove wz_converting
tag @s add wz_converting
scoreboard players operation #max_health wz_state = @s wall_spawn_health
scoreboard players set #converted wz_state 0
execute store result score #converted wz_state run function zombies:waves/spawning/zombie/creation/summon_piglin
execute if score #converted wz_state matches 1 store result score #converted wz_state as @e[type=zombified_piglin,tag=wz_new_piglin,limit=1] at @s run function zombies:waves/spawning/zombie/animation/init_piglin
scoreboard players set #failure_reason wz_state 5
execute unless score #converted wz_state matches 1 run return run function zombies:waves/spawning/zombie/animation/fail
scoreboard players operation #finished_source wz_state = @s wz_source
execute as @e[type=marker,tag=zombie_spawner] if score @s wz_source = #finished_source wz_state run scoreboard players reset @s wz_failures
tag @s remove wz_slot
tag @s remove wave_enemy
tag @s remove wz_converting
tag @s remove wall_zombie
tag @s remove wall_zombie_exiting
tag @s add wall_cleanup_mannequin
data merge entity @s {Invisible:1b,Silent:1b}
tp @s ~ -1000 ~
