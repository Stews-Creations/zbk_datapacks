# === AUTO ZONE HIGHLIGHT - ACTIVATE ===
# Runs as a custom_door marker that is cd_player_nearby but NOT cd_zone_active
# Spawns glowing magma cubes at non-air SAVED blocks; corners glow green

# Skip if already active (partner may have activated us this tick)
execute if entity @s[tag=cd_zone_active] run return 0

# Get link ID, skip if unlinked
execute store result score #highlight_id global run scoreboard players get @s custom_door_id
execute if score #highlight_id global matches 0 run return 0

# Tag self, find partner
tag @s add cd_highlight_self
execute as @e[type=marker,tag=custom_door,tag=!cd_highlight_self] if score @s custom_door_id = #highlight_id global run tag @s add cd_highlight_partner

# No partner → cleanup and skip
execute unless entity @e[tag=cd_highlight_partner] run tag @s remove cd_highlight_self
execute unless entity @e[tag=cd_highlight_partner] run return 0

# Check for duplicate IDs (more than 1 partner = more than 2 markers share this ID)
execute store result score #cd_partner_count global if entity @e[tag=cd_highlight_partner]
execute if score #cd_partner_count global matches 2.. at @s run tellraw @a[distance=..15] [{"text":"[Build Manager] ","color":"gold"},{"text":"Duplicate Link ID! Multiple markers share ID ","color":"red"},{"score":{"name":"#highlight_id","objective":"global"},"color":"yellow"},{"text":". Each ID must be used by exactly 2 markers.","color":"red"}]
execute if score #cd_partner_count global matches 2.. run tag @s add cd_zone_active
execute if score #cd_partner_count global matches 2.. run tag @e[tag=cd_highlight_self] remove cd_highlight_self
execute if score #cd_partner_count global matches 2.. run tag @e[tag=cd_highlight_partner] remove cd_highlight_partner
execute if score #cd_partner_count global matches 2.. run return 0

# Partner already active → pair already highlighted, just tag self as active too
execute if entity @e[tag=cd_highlight_partner,tag=cd_zone_active] run tag @s add cd_zone_active
execute if entity @e[tag=cd_highlight_partner,tag=cd_zone_active] run tag @e[tag=cd_highlight_partner] remove cd_highlight_partner
execute if entity @e[tag=cd_highlight_partner,tag=cd_zone_active] run tag @s remove cd_highlight_self
execute if entity @e[tag=cd_highlight_partner,tag=cd_zone_active] run return 0

# === Find Corner 1 (stores saved_zone data) ===
execute if entity @e[tag=cd_highlight_self,tag=custom_door_1] run tag @e[tag=cd_highlight_self] add cd_highlight_c1
execute unless entity @e[tag=cd_highlight_c1] if entity @e[tag=cd_highlight_partner,tag=custom_door_1] run tag @e[tag=cd_highlight_partner] add cd_highlight_c1
execute unless entity @e[tag=cd_highlight_c1] run tag @e[tag=cd_highlight_self] add cd_highlight_c1

# === Scan saved zone blocks (only if zone has been saved) ===
execute if data entity @e[tag=cd_highlight_c1,limit=1] data.saved_zone run function zbk:build_kit/management/custom_door/highlight/scan_saved

# === Assign door ID to all new cubes ===
scoreboard players operation @e[type=magma_cube,tag=cd_highlight_new] custom_door_id = #highlight_id global

# === Color closest cube to each corner marker green ===
execute at @e[tag=cd_highlight_self,limit=1] run team join highlight_green @e[type=magma_cube,tag=cd_highlight_new,distance=..1,sort=nearest,limit=1]
execute at @e[tag=cd_highlight_partner,limit=1] run team join highlight_green @e[type=magma_cube,tag=cd_highlight_new,distance=..1,sort=nearest,limit=1]

tag @e[tag=cd_highlight_new] remove cd_highlight_new

# Tag both markers as active
tag @e[tag=cd_highlight_self] add cd_zone_active
tag @e[tag=cd_highlight_partner] add cd_zone_active

# Cleanup temp tags
tag @e[tag=cd_highlight_self] remove cd_highlight_self
tag @e[tag=cd_highlight_partner] remove cd_highlight_partner
tag @e[tag=cd_highlight_c1] remove cd_highlight_c1
