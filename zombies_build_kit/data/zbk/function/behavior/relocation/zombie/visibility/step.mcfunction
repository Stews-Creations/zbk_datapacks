execute if entity @e[type=marker,tag=zr_aim,distance=..0.6] run return run scoreboard players set #visible zr_state 1
execute if block ~ ~ ~ #zbk:recovery_occluder run return 0
scoreboard players add #ray_steps zr_state 1
execute if score #ray_steps zr_state matches 256.. run return run scoreboard players set #visible zr_state 1
execute positioned ^ ^ ^0.5 run function zbk:behavior/relocation/zombie/visibility/step
