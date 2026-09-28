execute unless entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] run return 0
execute store result score #gun_id temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.gun_id
execute unless score #gun_id temp matches 20..46 unless score #gun_id temp matches 7 unless score #gun_id temp matches 14..15 run return 0

# ===================================
# WALL GUN - BUY GUN (First Purchase)
# ===================================
# Purpose: Handle first-time purchase - give gun to player
# Called when player doesn't own this gun yet
# Executed as player, at player position
# ===================================

# Get price from nearest wall gun marker
execute store result score #wall_gun_cost temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.price

# Check if player has enough points
execute unless score @s player_points >= #wall_gun_cost temp run tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"#wall_gun_cost","objective":"temp"},"color":"yellow"},{"text":" points.","color":"gold"}]
execute unless score @s player_points >= #wall_gun_cost temp run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute unless score @s player_points >= #wall_gun_cost temp run return fail

# Deduct points from player
scoreboard players operation @s player_points -= #wall_gun_cost temp

# Play purchase sounds
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.5

# Get the gun ID and give the weapon
execute store result score #gun_id temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.gun_id
function zombies:map_elements/mystery_box/guns/give_gun_by_id

# Get gun name for feedback
function zbk:dispatch/voice_event_wall_buy
function zombies:map_elements/wall_gun/lookup/get_item_name
tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"green"},{"text":"Purchased ","color":"gold"},{"nbt":"gun_name","storage":"zombies:temp","color":"yellow","bold":true}]

# Debug message
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s[tag=debug] [{"text":"[WALL] ","color":"aqua"},{"text":"Wall gun purchased: ","color":"green"},{"nbt":"gun_name","storage":"zombies:temp","color":"yellow"}]
