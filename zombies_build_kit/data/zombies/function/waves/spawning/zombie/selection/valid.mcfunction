# Read-only gate as/at marker. Used by both spawning and recovery discovery.
scoreboard players set #mode wz_state -2
execute unless entity @s[type=marker,tag=zombie_spawner,scores={spawner_unlocked=1}] run return 0
execute if score @s wz_blocked > #now wz_state run return 0
scoreboard players set #mode wz_state -1
execute store result score #mode wz_state run data get entity @s data.mode
execute unless score #mode wz_state matches 0..8 run return 0
execute if score #mode wz_state matches 1..4 if entity @e[type=mannequin,tag=hole_zombie,distance=..4] run return 0
execute if score #mode wz_state matches 1..4 if entity @e[type=mannequin,tag=hole_cleanup_mannequin,distance=..4] run return 0
execute if score #mode wz_state matches 5..8 if entity @e[type=mannequin,tag=wall_zombie,distance=..4] run return 0
execute if score #mode wz_state matches 5..8 if entity @e[type=mannequin,tag=wall_cleanup_mannequin,distance=..4] run return 0
# A source link also keeps a tall wall animation busy after it leaves the 4-block neighborhood.
scoreboard players set #source wz_state -1
execute if score @s wz_source matches 1.. run scoreboard players operation #source wz_state = @s wz_source
scoreboard players set #busy wz_state 0
execute if score #source wz_state matches 1.. as @e[type=mannequin,tag=hole_zombie] if score @s wz_source = #source wz_state run scoreboard players set #busy wz_state 1
execute if score #source wz_state matches 1.. as @e[type=mannequin,tag=wall_zombie] if score @s wz_source = #source wz_state run scoreboard players set #busy wz_state 1
execute if score #busy wz_state matches 1 run return 0
return 1
