# ===================================
# RADIO - INTERACT
# ===================================
# Purpose: Handle player right-clicking the radio interaction entity
# Called from advancement/interaction_radio.json

# Revoke advancement so it can trigger again
advancement revoke @s only zbk:interaction_radio

# Check if player is holding build manager stick - open config dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run tag @e[type=marker,tag=radio_marker,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:map_elements/radio/build_kit/dialogs/open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# If holding a gun in offhand, force fire it (interaction intercepted the right-click)
execute if items entity @s weapon.offhand *[custom_data~{gun:true}] run function zbk:combat/weapons/firing/force_fire
