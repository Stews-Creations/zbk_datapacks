execute store result score #valid wz_state run function zombies:waves/spawning/zombie/selection/valid
execute if score #valid wz_state matches 1 run tag @s add wz_candidate
execute if score #mode wz_state matches -1 unless entity @s[tag=wz_invalid_reported] run function zombies:waves/spawning/zombie/selection/report_invalid
execute if score #mode wz_state matches 9.. unless entity @s[tag=wz_invalid_reported] run function zombies:waves/spawning/zombie/selection/report_invalid
