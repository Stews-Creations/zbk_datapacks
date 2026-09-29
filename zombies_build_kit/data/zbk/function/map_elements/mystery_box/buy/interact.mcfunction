# Mystery Box Interaction Handler
# Triggered when player right-clicks mystery box interaction entity
# Called directly from advancement/interaction_mystery_box.json

# Revoke advancement so it can trigger again
advancement revoke @s only zbk:interaction_mystery_box

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Check if player is holding build manager stick - open config dialog instead
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run tag @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:map_elements/mystery_box/build_kit/dialogs/open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Store the interacting player's ID in temp
scoreboard players operation #interacting_player_id temp = @s id

# Store player ID on the nearest mystery box location marker ONLY when box is ready
# Once buy animation starts, mystery_box_ready is set to 0, preventing ID from being overwritten
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] if score @s mystery_box_ready matches 1 run scoreboard players operation @s mystery_box_player_id = #interacting_player_id temp

# Find nearest mystery box location and execute appropriate action
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/buy/interact_handler
