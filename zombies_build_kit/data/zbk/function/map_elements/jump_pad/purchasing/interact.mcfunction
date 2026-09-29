# ===================================
# JUMP PAD - INTERACTION HANDLER
# ===================================
# Triggered when player right-clicks jump pad interaction entity
# Called directly from advancement/interaction_jump_pad.json
# ===================================

# Revoke advancement so it can trigger again
advancement revoke @s only zbk:interaction_jump_pad

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Check if player is holding build manager stick
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run tag @e[type=marker,tag=jump_pad,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:map_elements/jump_pad/build_kit/dialogs/open_config_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Otherwise, find the nearest jump pad marker (not purchased) and execute buy function
execute at @s run function zbk:map_elements/jump_pad/purchasing/buy
