# Distance relocation shares the teleporter's counted-slot refund paths.
tag @e[tag=zr_far] remove zr_far
$execute as @e[type=zombified_piglin,tag=wave_enemy,tag=wz_slot] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..$(relocate_distance)] run tag @s add zr_far
$execute as @e[type=mannequin,tag=hole_zombie,tag=wz_slot] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..$(relocate_distance)] run tag @s add zr_far
$execute as @e[type=mannequin,tag=wall_zombie,tag=wz_slot] at @s unless entity @a[gamemode=adventure,team=!downed,distance=..$(relocate_distance)] run tag @s add zr_far
execute unless entity @e[tag=zr_far] run return 0

# Do not remove enemies until the normal selector has a usable destination.
scoreboard players set #replacement zr_state 0
function zbk:waves/spawning/zombie/selection/config
execute as @a[gamemode=adventure,team=!downed,scores={id=1..}] at @s run function zbk:behavior/relocation/zombie/replacement with storage zbk:zombie_spawn
execute if score #replacement zr_state matches 1 as @e[type=zombified_piglin,tag=zr_far] at @s run function zbk:behavior/relocation/refund_zombie
execute if score #replacement zr_state matches 1 as @e[type=mannequin,tag=zr_far] at @s run function zbk:behavior/relocation/refund_mannequin
tag @e[tag=zr_far] remove zr_far
