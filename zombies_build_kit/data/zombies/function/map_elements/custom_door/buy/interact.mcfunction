# ===================================
# CUSTOM DOOR - INTERACTION HANDLER
# ===================================
# Triggered via advancement when player right-clicks sign interaction entity
# Routes to build kit config dialog (if holding build stick) or purchase flow

# Revoke advancement so it can trigger again
advancement revoke @s only zombies:interaction_custom_door_sign

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Find the clicked interaction's UID to identify the correct sign (not just nearest)
execute store result score #cd_buy_uid global run scoreboard players get @e[type=interaction,tag=custom_door_sign_interaction,distance=..5,limit=1,sort=nearest] cd_sign_uid

# Check if player is holding build manager stick — open config dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] as @e[type=marker,tag=custom_door_sign] if score @s cd_sign_uid = #cd_buy_uid global run tag @s add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zombies:build_kit/management/custom_door_sign/dialogs/open_config_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Otherwise, try to buy
execute at @s run function zombies:map_elements/custom_door/buy/buy
