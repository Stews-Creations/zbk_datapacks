# === TOGGLE CUSTOM DOOR POWER ===
# Toggles power door setting on the nearest door's Corner 1

# Find nearest custom_door marker
execute unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run return run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No custom door marker nearby!","color":"red"}]

# Get marker's link ID
execute store result score #cd_toggle_id global run scoreboard players get @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id
execute if score #cd_toggle_id global matches 0 run return run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Door is unlinked (ID=0). Assign a Link ID first.","color":"red"}]

# Find Corner 1 with matching ID
tag @e[type=marker,tag=custom_door_1] remove cd_power_toggle
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_toggle_id global run tag @s add cd_power_toggle
execute unless entity @e[tag=cd_power_toggle] run return run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No Corner 1 found with matching ID!","color":"red"}]

# Snapshot current value before toggling
scoreboard players set #cd_power_was_on global 0
execute if score @e[tag=cd_power_toggle,limit=1] custom_door_power matches 1 run scoreboard players set #cd_power_was_on global 1

# Toggle: was ON -> OFF
execute if score #cd_power_was_on global matches 1 run scoreboard players set @e[tag=cd_power_toggle,limit=1] custom_door_power 0
execute if score #cd_power_was_on global matches 1 run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Power Door: ","color":"green"},{"text":"OFF","color":"red","bold":true}]

# Toggle: was OFF -> ON
execute if score #cd_power_was_on global matches 0 run scoreboard players set @e[tag=cd_power_toggle,limit=1] custom_door_power 1
execute if score #cd_power_was_on global matches 0 run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Power Door: ","color":"green"},{"text":"ON","color":"aqua","bold":true}]

# Update linked sign displays
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_toggle_id global at @s run function zombies:map_elements/custom_door/management/update_display

# Cleanup
tag @e[tag=cd_power_toggle] remove cd_power_toggle
