execute store result score #gun_id temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.gun_id
execute unless score #gun_id temp matches 20..46 unless score #gun_id temp matches 7 unless score #gun_id temp matches 13..15 run return 0

# ===================================
# WALL GUN - BUY AMMO (Refill)
# ===================================
# Purpose: Handle ammo refill purchase for owned weapon
# Called when player already owns this gun
# Executed as player, at player position
# ===================================

# Read regular ammo cost; packed cost follows the matching owned slot.
execute as @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] run function zbk:map_elements/wall_gun/marker/initialize_prices
execute store result score #wall_gun_cost temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.ammo_price


scoreboard players set #wall_gun_packed temp 0
execute if score #owned_slot temp matches 1 if score @s gun_1 = #gun_id temp if score @s tier_1 matches 1.. run scoreboard players set #wall_gun_packed temp 1
execute if score #owned_slot temp matches 2 if score @s gun_2 = #gun_id temp if score @s tier_2 matches 1.. run scoreboard players set #wall_gun_packed temp 1
execute if score #owned_slot temp matches 3 if score @s gun_3 = #gun_id temp if score @s tier_3 matches 1.. run scoreboard players set #wall_gun_packed temp 1
execute if score #wall_gun_packed temp matches 1 store result score #wall_gun_cost temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.pap_ammo_price

# Check if player has enough points
execute unless score @s player_points >= #wall_gun_cost temp run tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"#wall_gun_cost","objective":"temp"},"color":"yellow"},{"text":" points for ammo.","color":"gold"}]
execute unless score @s player_points >= #wall_gun_cost temp run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute unless score @s player_points >= #wall_gun_cost temp run return fail

# Deduct points from player
scoreboard players operation @s player_points -= #wall_gun_cost temp

# Play purchase sounds (different from full purchase)
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
playsound minecraft:entity.item.pickup master @s ~ ~ ~ 0.5 1.2

# Refill ammo based on which slot has the gun (slot 0 = grenades)
execute if score #owned_slot temp matches 0 run function zbk:map_elements/wall_gun/gameplay/refill_grenade_ammo
execute if score #owned_slot temp matches 1 run function zbk:map_elements/wall_gun/gameplay/refill_ammo_slot_1
execute if score #owned_slot temp matches 2 run function zbk:map_elements/wall_gun/gameplay/refill_ammo_slot_2
execute if score #owned_slot temp matches 3 run function zbk:map_elements/wall_gun/gameplay/refill_ammo_slot_3
execute if score #owned_slot temp matches 4 run function zbk:map_elements/wall_gun/gameplay/refill_special_equipment_ammo

# Get gun name for feedback
execute store result score #gun_id temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.gun_id
function zbk:map_elements/wall_gun/lookup/get_item_name
tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"green"},{"text":"Ammo refilled for ","color":"gold"},{"nbt":"gun_name","storage":"zbk:temp","color":"yellow","bold":true}]

# Debug message
function zbk:debug/info {f:"WALL",m:"Wall gun ammo purchased"}
