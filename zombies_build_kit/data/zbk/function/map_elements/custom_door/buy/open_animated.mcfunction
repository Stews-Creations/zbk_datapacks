# ===================================
# CUSTOM DOOR - OPEN (ANIMATED)
# ===================================
# Runs as sign marker. Sets up animation state for Up/Down styles.
# Shared purchased/UI/effects logic already handled by buy/open.
# Called from: buy/open

# Find Corner 1 with matching link ID
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_id global run tag @s add cd_sign_corner

# Check if corner with saved data was found
execute unless entity @e[tag=cd_sign_corner] run return 0
execute unless data entity @e[tag=cd_sign_corner,limit=1] data.saved_zone run tag @e[tag=cd_sign_corner] remove cd_sign_corner
execute unless entity @e[tag=cd_sign_corner] run return 0

# Store zone bounds on this sign marker for animation ticks
data modify entity @s data.anim_zone set from entity @e[tag=cd_sign_corner,limit=1] data.saved_zone

# Tag block_displays in zone for animation
execute store result score #cd_min_x global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.min_x
execute store result score #cd_min_y global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.min_y
execute store result score #cd_min_z global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.min_z
execute store result score #cd_size_x global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.size_x
execute store result score #cd_size_y global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.size_y
execute store result score #cd_size_z global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.size_z
execute store result storage zbk:temp bd_anim.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp bd_anim.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp bd_anim.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zbk:temp bd_anim.dx int 1 run scoreboard players get #cd_size_x global
execute store result storage zbk:temp bd_anim.dy int 1 run scoreboard players get #cd_size_y global
execute store result storage zbk:temp bd_anim.dz int 1 run scoreboard players get #cd_size_z global
execute store result storage zbk:temp bd_anim.door_id int 1 run scoreboard players get #cd_sign_id global
function zbk:map_elements/custom_door/animations/layers/tag_block_displays with storage zbk:temp bd_anim

# Start animation timer at 0
scoreboard players set @s cd_sign_anim 0

# Unlock spawner zones
data modify storage zbk:temp unlock_zones set from entity @s data.zones
function zbk:map_elements/door/management/unlock_spawners_recursive

# Cleanup corner tag before linked doors (prevents tag collision in nested open calls)
tag @e[tag=cd_sign_corner] remove cd_sign_corner

# Open any linked doors (bidirectional - purchased check prevents loops)
function zbk:map_elements/custom_door/buy/open_linked_doors
