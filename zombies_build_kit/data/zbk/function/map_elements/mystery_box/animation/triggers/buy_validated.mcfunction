# Internal function - called with @s = mystery_box_location marker
# Validates and plays buy animation

# Validate buy animation can be played
execute unless function zbk:map_elements/mystery_box/animation/validation/validate_buy run return 0

# Calculate cost based on fire sale status
scoreboard players set #box_cost temp 950
execute if score global fire_sale matches 1 run scoreboard players set #box_cost temp 10

# Get stored player ID from marker
scoreboard players operation #player_id temp = @s mystery_box_player_id

# Check if player has enough points - ERROR MESSAGE (keep visible to all players)
execute as @a if score @s id = #player_id temp unless score @s player_points >= #box_cost temp run tellraw @s [{"text":"[MYSTERY BOX] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"#box_cost","objective":"temp"},"color":"yellow"},{"text":" points.","color":"gold"}]
execute as @a if score @s id = #player_id temp unless score @s player_points >= #box_cost temp run return 0

# Deduct points from player
execute as @a if score @s id = #player_id temp run scoreboard players operation @s player_points -= #box_cost temp

# Debug message
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[BOX] ","color":"aqua"},{"text":"Mystery Box purchased for ","color":"green"},{"score":{"name":"#box_cost","objective":"temp"},"color":"gold"},{"text":" points","color":"green"}]

# Increment spin counter for this location (only if not during fire sale)
execute unless score global fire_sale matches 1 run scoreboard players add @s mystery_box_spins 1

# Play animation based on facing direction
execute if entity @s[tag=facing_south] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/buy_south/play_anim
execute if entity @s[tag=facing_north] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/buy_north/play_anim
execute if entity @s[tag=facing_east] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/buy_east/play_anim
execute if entity @s[tag=facing_west] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/buy_west/play_anim

# Clear ready state after starting buy animation
scoreboard players set @s mystery_box_ready 0
