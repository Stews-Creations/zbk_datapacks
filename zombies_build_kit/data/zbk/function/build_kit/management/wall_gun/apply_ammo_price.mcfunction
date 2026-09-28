# ===================================
# BUILD KIT - APPLY WALL GUN AMMO PRICE
# ===================================
# Purpose: Apply ammo refill price to wall gun marker
# Macro function - receives ammo_price as parameter
# ===================================

$scoreboard players set #selected_ammo_price global $(ammo_price)

# Apply to nearest wall gun
execute as @p at @s if entity @e[type=marker,tag=wall_gun,distance=..5,limit=1] store result entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.ammo_price int 1 run scoreboard players get #selected_ammo_price global

# Schedule reinitialization to update displays
schedule function zbk:map_elements/wall_gun/initialize 1t

# Debug-only setup confirmation
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s[tag=debug] [{"text":"[Build Manager] ","color":"gold"},{"text":"Wall gun ammo price set to ","color":"green"},{"score":{"name":"#selected_ammo_price","objective":"global"},"color":"yellow","bold":true}]

# Reopen the dialog to keep it open
function zbk:build_kit/management/wall_gun/dialogs/open_config_dialog_refresh
