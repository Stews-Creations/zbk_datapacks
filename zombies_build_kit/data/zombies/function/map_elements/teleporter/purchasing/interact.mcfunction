# ===================================
# TELEPORTER - INTERACTION HANDLER
# ===================================
# Triggered when player right-clicks teleporter interaction entity
# Called from advancement/interaction_teleporter.json
# ===================================

# Revoke advancement so it can trigger again
advancement revoke @s only zombies:interaction_teleporter

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Check if player is holding build manager stick
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] at @s if entity @e[type=marker,tag=teleporter,distance=..5,limit=1,sort=nearest] run tag @e[type=marker,tag=teleporter,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zombies:build_kit/management/teleporter/dialogs/open_config_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Check if near a START marker - forward teleport
execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_start,distance=..1.75] run function zombies:map_elements/teleporter/purchasing/buy
execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_start,distance=..1.75] run return 1

# Check if near an END marker - return teleport (two-way)
execute at @s if entity @e[type=marker,tag=teleporter,tag=tp_end,distance=..1.75] run function zombies:map_elements/teleporter/purchasing/buy_return
