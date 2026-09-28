# === DOOR INTERACTION HANDLER ===
# Triggered when player right-clicks door interaction entity
# Called directly from advancement/interaction_door.json

# Revoke advancement so it can trigger again
advancement revoke @s only zbk:interaction_door

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Check if player is holding build manager stick
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run tag @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:build_kit/management/door/dialogs/open_config_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Otherwise, find the nearest door marker (not purchased) and execute buy function
execute at @s run function zbk:map_elements/door/purchasable/buy
