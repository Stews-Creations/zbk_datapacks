# === APPLY DOOR ADD ZONE ===
# Macro function - receives zone number to add
# Adds the zone to the door's zones array

# Store the zone value
$scoreboard players set #selected_zone global $(zone)

# Initialize zones array if it doesn't exist (create empty array)
execute as @p at @s unless data entity @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] data.zones run data modify entity @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] data.zones set value []

# Check if zone already exists
$execute as @p at @s store result score #zone_exists global if data entity @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] data.zones[$(zone)]

# If zone already exists, show error and return
execute if score #zone_exists global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Zone ","color":"red"},{"score":{"name":"#selected_zone","objective":"global"},"color":"yellow","bold":true},{"text":" is already added to this door","color":"red"}]
execute if score #zone_exists global matches 1.. run return fail

# Append the zone to the zones array
$execute as @p at @s run data modify entity @e[type=marker,tag=door,distance=..10,limit=1,sort=nearest] data.zones append value $(zone)

# Feedback to player
execute if score #selected_zone global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Added Zone 0 (Always Available) to door","color":"green"}]
execute if score #selected_zone global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Added Zone ","color":"green"},{"score":{"name":"#selected_zone","objective":"global"},"color":"yellow","bold":true},{"text":" to door","color":"green"}]

# Reopen the dialog to keep it open
function zbk:build_kit/management/door/dialogs/open_config_dialog_refresh
