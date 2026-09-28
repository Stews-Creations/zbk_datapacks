execute unless score #global game_active matches 1 run return 0
execute if score #global wave.is_dog_round matches 1 run return 0
execute unless entity @a[gamemode=adventure,team=!downed] run return 0
execute store result score #now wz_state run time query gametime
execute store result storage zombies:zombie_recovery relocate_distance int 1 run scoreboard players get #relocate_distance zr_cfg
function zombies:behavior/relocation/zombie/distance with storage zombies:zombie_recovery
execute unless score #enabled zr_cfg matches 1 run return 0
scoreboard players operation #budget zr_state = #budget zr_cfg
execute store result storage zombies:zombie_recovery distance int 1 run scoreboard players get #distance zr_cfg
execute as @e[type=zombified_piglin,tag=wave_enemy,tag=wz_slot] at @s run function zombies:behavior/relocation/zombie/sample with storage zombies:zombie_recovery
