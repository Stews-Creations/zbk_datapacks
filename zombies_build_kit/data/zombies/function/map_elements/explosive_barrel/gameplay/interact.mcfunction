# ===================================
# EXPLOSIVE BARREL - INTERACT
# ===================================
# Purpose: Handle player right-clicking the explosive barrel interaction entity
# Called from advancement/interaction_explosive_barrel.json

# Revoke advancement so it can trigger again
advancement revoke @s only zombies:interaction_explosive_barrel

# Check if player is holding build manager stick - open config dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run tag @e[type=marker,tag=explosive_barrel,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zombies:build_kit/management/explosive_barrel/dialogs/open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# If holding a gun in offhand, force fire it (interaction intercepted the right-click)
execute if items entity @s weapon.offhand *[custom_data~{gun:true}] run function zombies:combat/weapons/force_fire
