# === APPLY DOOR PRICE ===
# Macro function - receives price as parameter
# Applies the price to the nearest door

# Store the price value in scoreboard
$scoreboard players set #selected_price global $(price)

# Apply to nearest door (within 10 blocks to be safe)
execute as @p at @s if entity @e[type=marker,tag=door,distance=..5,limit=1] store result entity @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] data.name int 1 run scoreboard players get #selected_price global

# Update the text display
execute as @p at @s as @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] at @s store result score @n[type=text_display,tag=door,distance=..2] door_price run data get entity @s data.name

# Schedule door initialization to update displays
schedule function zbk:map_elements/door/initialize 1t

# Feedback to player
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Door price set to ","color":"green"},{"score":{"name":"#selected_price","objective":"global"},"color":"yellow","bold":true},{"text":" points","color":"green"}]

# Reopen the dialog to keep it open
function zbk:build_kit/management/door/dialogs/open_config_dialog_refresh
