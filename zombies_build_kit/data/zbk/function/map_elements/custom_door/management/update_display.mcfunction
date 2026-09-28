# ===================================
# CUSTOM DOOR - UPDATE SIGN DISPLAY
# ===================================
# Runs as sign marker. Updates or creates the text display showing price.
# Shows "Requires Power" if linked to a power door.
# Called from: reset/reset, build_kit apply_price, build_kit toggle_power

# Store the price in a temp scoreboard
scoreboard players set $door_temp door_price 0
execute store result score $door_temp door_price run data get entity @s data.name 1

# Store this sign's UID for matching
execute store result score #cd_sign_uid global run scoreboard players get @s cd_sign_uid

# Check if this is a power door (linked Corner 1 has custom_door_power=1)
scoreboard players set #cd_is_power global 0
execute store result score #cd_sign_link global run scoreboard players get @s custom_door_id
execute if score #cd_sign_link global matches 1.. as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_link global if score @s custom_door_power matches 1 run scoreboard players set #cd_is_power global 1

# Power doors: remove interaction and text display (no manual purchase needed)
execute if score #cd_is_power global matches 1 as @e[type=interaction,tag=custom_door_sign_interaction,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run kill @s
execute if score #cd_is_power global matches 1 as @e[type=text_display,tag=custom_door_sign_ui,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run kill @s
execute if score #cd_is_power global matches 1 run return 0

# Non-power doors: create text display + interaction if missing (matched by UID)
scoreboard players set #cd_found_display global 0
execute as @e[type=text_display,tag=custom_door_sign_ui,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run scoreboard players set #cd_found_display global 1

scoreboard players set #cd_found_interact global 0
execute as @e[type=interaction,tag=custom_door_sign_interaction,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run scoreboard players set #cd_found_interact global 1

# If either is missing, kill both and recreate via shared function
execute if score #cd_found_display global matches 0 run function zbk:map_elements/custom_door/management/create_sign_ui
execute if score #cd_found_interact global matches 0 unless score #cd_found_display global matches 0 run function zbk:map_elements/custom_door/management/create_sign_ui

# Update text on THIS sign's display (matched by UID)
execute store result score #cd_sign_uid global run scoreboard players get @s cd_sign_uid
execute as @e[type=text_display,tag=custom_door_sign_ui,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run data modify entity @s text set value [{"text":"Purchase\n","color":"gold","bold":true},{"score":{"name":"$door_temp","objective":"door_price"},"color":"yellow","bold":true}]
execute as @e[type=text_display,tag=custom_door_sign_ui,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run data modify entity @s text_opacity set value -1b

# Keep existing purchase labels at the same close range as wall-gun text.
execute as @e[type=text_display,tag=custom_door_sign_ui,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run data merge entity @s {view_range:0.125f}
