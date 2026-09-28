# === APPLY POWERED DOOR REMOVE ZONE ===
# Macro function - receives zone number to remove
# Removes ALL instances of the zone value from the powered door's zones array

# Store the zone value
$scoreboard players set #selected_zone global $(zone)
$scoreboard players set #zone_to_remove global $(zone)

# Tag the nearest powered door
execute as @p at @s run tag @e[type=marker,tag=door_powered,distance=..10,limit=1,sort=nearest] add temp_door

# Copy zones to temp storage and prepare new array
data modify storage zbk:temp old_zones set from entity @e[tag=temp_door,limit=1] data.zones
data modify storage zbk:temp new_zones set value []

# Filter out the target zone
function zbk:build_kit/management/powered_door/remove_zone_recursive

# Set the filtered array back
data modify entity @e[tag=temp_door,limit=1] data.zones set from storage zbk:temp new_zones

# Clean up
tag @e[tag=temp_door] remove temp_door

# Feedback to player
execute if score #selected_zone global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Removed Zone 0 (Always Available) from powered door","color":"green"}]
execute if score #selected_zone global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Removed Zone ","color":"green"},{"score":{"name":"#selected_zone","objective":"global"},"color":"yellow","bold":true},{"text":" from powered door","color":"green"}]

# Reopen the dialog to keep it open
function zbk:build_kit/management/powered_door/dialogs/open_zone_dialog_refresh
