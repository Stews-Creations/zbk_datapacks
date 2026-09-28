# === AUTO ZONE HIGHLIGHT - DEACTIVATE ===
# Runs as a cd_zone_active marker that is NOT cd_player_nearby
# Only deactivates if partner is also not nearby (both corners out of range)

# Get link ID
execute store result score #highlight_id global run scoreboard players get @s custom_door_id

# Check if partner still has cd_player_nearby → don't deactivate yet
scoreboard players set #cd_partner_nearby global 0
tag @s add cd_auto_off_self
execute as @e[type=marker,tag=custom_door,tag=!cd_auto_off_self,tag=cd_player_nearby] if score @s custom_door_id = #highlight_id global run scoreboard players set #cd_partner_nearby global 1
tag @s remove cd_auto_off_self
execute if score #cd_partner_nearby global matches 1 run return 0

# Partner also not nearby → deactivate
# TP cubes to void (prevents splitting/loot vs kill)
execute as @e[type=magma_cube,tag=cd_highlight_cube] if score @s custom_door_id = #highlight_id global run tp @s ~ -10000 ~

# Remove cd_zone_active from self and partner
tag @s remove cd_zone_active
execute as @e[type=marker,tag=custom_door] if score @s custom_door_id = #highlight_id global run tag @s remove cd_zone_active
