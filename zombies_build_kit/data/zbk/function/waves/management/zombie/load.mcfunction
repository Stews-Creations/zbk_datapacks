scoreboard objectives add wz_state dummy
scoreboard objectives add wz_cfg dummy
scoreboard objectives add wz_source dummy
scoreboard objectives add wz_weight dummy
scoreboard objectives add wz_sector dummy
scoreboard objectives add wz_recent dummy
scoreboard objectives add wz_blocked dummy
scoreboard objectives add wz_failures dummy
scoreboard objectives add wz_age dummy
scoreboard objectives add wz_origin_y dummy
scoreboard objectives add wz_speed dummy
execute unless score #near wz_cfg matches 1.. run scoreboard players set #near wz_cfg 16
execute unless score #middle wz_cfg matches 1.. run scoreboard players set #middle wz_cfg 28
execute unless score #range wz_cfg matches 1.. run scoreboard players set #range wz_cfg 40
execute unless score #weight_near wz_cfg matches 1.. run scoreboard players set #weight_near wz_cfg 12
execute unless score #weight_middle wz_cfg matches 1.. run scoreboard players set #weight_middle wz_cfg 8
execute unless score #weight_outer wz_cfg matches 1.. run scoreboard players set #weight_outer wz_cfg 4
execute unless score #fresh_factor wz_cfg matches 1.. run scoreboard players set #fresh_factor wz_cfg 2
execute unless score #sector_factor wz_cfg matches 1.. run scoreboard players set #sector_factor wz_cfg 2
execute unless score #recent_ticks wz_cfg matches 1.. run scoreboard players set #recent_ticks wz_cfg 100
execute unless score #retry_ticks wz_cfg matches 1.. run scoreboard players set #retry_ticks wz_cfg 20
execute unless score #attempt_factor wz_cfg matches 1.. run scoreboard players set #attempt_factor wz_cfg 2
execute unless score #animation_ticks wz_cfg matches 1.. run scoreboard players set #animation_ticks wz_cfg 1200
execute unless score #climb_height wz_cfg matches 1.. run scoreboard players set #climb_height wz_cfg 4800
execute unless score #failure_limit wz_cfg matches 1.. run scoreboard players set #failure_limit wz_cfg 2
execute unless score #failure_ticks wz_cfg matches 1.. run scoreboard players set #failure_ticks wz_cfg 200
# Source IDs are monotonic across resets so unloaded markers cannot collide.
execute unless score #next_source wz_state matches 0.. run scoreboard players set #next_source wz_state 0
scoreboard players set #negative wz_state -1
