# ===================================
# BUILD KIT - WALL GUN CONFIG DIALOG
# ===================================
# Purpose: Open configuration dialog for wall gun
# Called when player uses build stick near wall gun marker
# ===================================

# Get current values from the tagged wall gun marker
execute unless entity @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] run return 0
execute as @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] run function zombies:map_elements/wall_gun/marker/initialize_prices
execute store result score #current_gun_id global run data get entity @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] data.gun_id
execute store result score #current_price global run data get entity @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] data.price
execute store result score #current_ammo_price global run data get entity @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] data.ammo_price

execute store result score #current_pap_ammo_price global run data get entity @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] data.pap_ammo_price

# Remove tag
tag @e[type=marker,tag=wall_gun,tag=open_dialog,distance=..5,limit=1,sort=nearest] remove open_dialog

# Store data for macro function
data modify storage zombies:temp wall_gun_dialog set value {gun_id:20,price:500,ammo_price:250,pap_ammo_price:4500}
execute store result storage zombies:temp wall_gun_dialog.gun_id int 1 run scoreboard players get #current_gun_id global
execute store result storage zombies:temp wall_gun_dialog.price int 1 run scoreboard players get #current_price global
execute store result storage zombies:temp wall_gun_dialog.ammo_price int 1 run scoreboard players get #current_ammo_price global

execute store result storage zombies:temp wall_gun_dialog.pap_ammo_price int 1 run scoreboard players get #current_pap_ammo_price global

# Resolve the selected weapon name for the configuration heading.
scoreboard players operation #gun_id temp = #current_gun_id global
data modify storage zombies:temp gun_name set value "Unknown weapon"
function zombies:map_elements/wall_gun/lookup/get_item_name
data modify storage zombies:temp wall_gun_dialog.gun_name set from storage zombies:temp gun_name

# Call macro function with storage data
function zombies:build_kit/management/wall_gun/dialogs/show_config_dialog with storage zombies:temp wall_gun_dialog
