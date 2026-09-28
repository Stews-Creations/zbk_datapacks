execute if entity @e[type=marker,tag=wz_selected,limit=1] run return 0
scoreboard players operation #draw wz_state -= @s wz_weight
execute if score #draw wz_state matches ..0 run tag @s add wz_selected
