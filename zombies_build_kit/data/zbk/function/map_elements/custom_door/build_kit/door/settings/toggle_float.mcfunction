# === TOGGLE CUSTOM DOOR FLOAT ===
# Toggles floating block display setting on the nearest door's Corner 1

# Find nearest custom_door marker
execute unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run return run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No custom door marker nearby!","color":"red"}]

# Get marker's link ID
execute store result score #cd_toggle_id global run scoreboard players get @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id
execute if score #cd_toggle_id global matches 0 run return run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Door is unlinked (ID=0). Assign a Link ID first.","color":"red"}]

# Find Corner 1 with matching ID
tag @e[type=marker,tag=custom_door_1] remove cd_float_toggle
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_toggle_id global run tag @s add cd_float_toggle
execute unless entity @e[tag=cd_float_toggle] run return run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No Corner 1 found with matching ID!","color":"red"}]

# Snapshot current value before toggling
scoreboard players set #cd_float_was_on global 0
execute if score @e[tag=cd_float_toggle,limit=1] custom_door_float matches 1 run scoreboard players set #cd_float_was_on global 1

# Toggle: was ON -> OFF
execute if score #cd_float_was_on global matches 1 run scoreboard players set @e[tag=cd_float_toggle,limit=1] custom_door_float 0
execute if score #cd_float_was_on global matches 1 run scoreboard players operation #cd_sign_id global = #cd_toggle_id global
execute if score #cd_float_was_on global matches 1 as @e[tag=cd_float_toggle,limit=1] at @s run function zbk:map_elements/custom_door/float/cleanup
execute if score #cd_float_was_on global matches 1 run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Float: ","color":"green"},{"text":"OFF","color":"red","bold":true}]

# Toggle: was OFF -> ON
execute if score #cd_float_was_on global matches 0 run scoreboard players set @e[tag=cd_float_toggle,limit=1] custom_door_float 1
execute if score #cd_float_was_on global matches 0 as @e[tag=cd_float_toggle,limit=1] at @s run function zbk:map_elements/custom_door/float/setup
execute if score #cd_float_was_on global matches 0 run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Float: ","color":"green"},{"text":"ON","color":"aqua","bold":true}]

# Cleanup
tag @e[tag=cd_float_toggle] remove cd_float_toggle
