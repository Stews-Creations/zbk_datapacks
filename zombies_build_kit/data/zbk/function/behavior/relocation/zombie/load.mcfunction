scoreboard objectives add zr_state dummy
scoreboard objectives add zr_cfg dummy
scoreboard objectives add zr_x dummy
scoreboard objectives add zr_y dummy
scoreboard objectives add zr_z dummy
scoreboard objectives add zr_still dummy
execute unless score #relocate_distance zr_cfg matches 1.. run scoreboard players set #relocate_distance zr_cfg 60
execute unless score #enabled zr_cfg matches 0..1 run scoreboard players set #enabled zr_cfg 0
execute unless score #still_seconds zr_cfg matches 1.. run scoreboard players set #still_seconds zr_cfg 30
execute unless score #distance zr_cfg matches 1.. run scoreboard players set #distance zr_cfg 48
execute unless score #movement zr_cfg matches 1.. run scoreboard players set #movement zr_cfg 25
execute unless score #budget zr_cfg matches 1.. run scoreboard players set #budget zr_cfg 2
