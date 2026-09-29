# ===================================
# BUILD KIT - APPLY WALL GUN ID
# ===================================
# Purpose: Apply gun selection to wall gun marker
# Macro function - receives gun_id as parameter
# ===================================

$scoreboard players set #selected_gun_id global $(gun_id)

# Accept only supported wall-buy weapon IDs.
execute unless score #selected_gun_id global matches 20..46 unless score #selected_gun_id global matches 7 unless score #selected_gun_id global matches 13..16 run return 0
execute unless entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] run return 0

# Apply to nearest wall gun
execute store result entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.gun_id int 1 run scoreboard players get #selected_gun_id global

# Bowie Knife uses its canonical 3,000-point price when first selected; builders may change it afterward.
execute if score #selected_gun_id global matches 16 run data modify entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.price set value 3000

# Schedule reinitialization to update displays
schedule function zbk:map_elements/wall_gun/initialize 1t

# Debug-only setup confirmation
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s[tag=debug] [{"text":"[Build Manager] ","color":"gold"},{"text":"Wall gun ID set to ","color":"green"},{"score":{"name":"#selected_gun_id","objective":"global"},"color":"yellow","bold":true}]

# Reopen the dialog to keep it open
function zbk:map_elements/wall_gun/build_kit/dialogs/open_config_dialog_refresh
