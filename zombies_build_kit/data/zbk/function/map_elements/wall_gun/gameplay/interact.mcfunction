execute as @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] run function zbk:combat/weapons/guns/bo3/migration/marker
# ===================================
# WALL GUN - INTERACT
# ===================================
# Purpose: Handle player interaction with wall gun
# Routes to buy_gun or buy_ammo based on ownership
# Triggered by advancement/interaction_wall_gun.json
# ===================================

# Revoke advancement so it can trigger again
advancement revoke @s only zbk:interaction_wall_gun

# Block interaction if player is downed
execute if entity @s[team=downed] run return fail

# Check if player is holding build manager stick - open config dialog instead
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run tag @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] add open_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run function zbk:build_kit/management/wall_gun/dialogs/open_config_dialog
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 1

# Get the gun ID from nearest wall gun marker
execute store result score #wall_gun_id temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.gun_id

# Special case: Bowie Knife (ID 16) - a permanent melee upgrade with no ammo purchase.
execute if score #wall_gun_id temp matches 16 at @s run function zbk:map_elements/wall_gun/gameplay/buy_bowie_knife
execute if score #wall_gun_id temp matches 16 run return 1

# Special case: Grenades (ID 13) - all players have grenades, always buy ammo
execute if score #wall_gun_id temp matches 13 run scoreboard players set #owns_wall_gun temp 1
execute if score #wall_gun_id temp matches 13 run scoreboard players set #owned_slot temp 0
execute if score #wall_gun_id temp matches 13 at @s run function zbk:map_elements/wall_gun/gameplay/buy_ammo
execute if score #wall_gun_id temp matches 13 run return 1

# Check if player already owns this gun (check all 3 slots)
function zbk:map_elements/wall_gun/gameplay/check_ownership

# Route based on ownership
# If #owns_wall_gun temp = 1, player already has the gun - buy ammo
# If #owns_wall_gun temp = 0, player doesn't have it - buy gun
execute if score #owns_wall_gun temp matches 1 at @s run function zbk:map_elements/wall_gun/gameplay/buy_ammo
execute if score #owns_wall_gun temp matches 0 at @s run function zbk:map_elements/wall_gun/gameplay/buy_gun
