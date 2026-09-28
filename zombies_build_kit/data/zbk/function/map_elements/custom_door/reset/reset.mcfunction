# ===================================
# CUSTOM DOOR - RESET
# ===================================
# Runs as each sign marker. Restores blocks if purchased, always restores BDs.
# Called from: initialize

# Stop any in-progress animation
scoreboard players set @s cd_sign_anim -1
execute store result score #cd_sign_id global run scoreboard players get @s custom_door_id
execute as @e[type=block_display,tag=cd_anim_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute as @e[type=item_display,tag=cd_anim_id] if score @s custom_door_id = #cd_sign_id global run kill @s

# Kill existing restored BDs and IDs (will be re-summoned below)
execute as @e[type=block_display,tag=cd_door_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute as @e[type=item_display,tag=cd_door_id] if score @s custom_door_id = #cd_sign_id global run kill @s

# If purchased: full restore (blocks + BDs)
execute if entity @s[tag=purchased] run function zbk:map_elements/custom_door/reset/restore_zone

# If not purchased: restore just BDs and IDs from saved data (in case they were lost)
execute unless entity @s[tag=purchased] as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_id global run tag @s add cd_restore_corner
execute unless entity @s[tag=purchased] if entity @e[tag=cd_restore_corner] if data entity @e[tag=cd_restore_corner,limit=1] data.saved_block_displays run data modify storage zbk:temp restore_bds set from entity @e[tag=cd_restore_corner,limit=1] data.saved_block_displays
execute unless entity @s[tag=purchased] if entity @e[tag=cd_restore_corner] if data entity @e[tag=cd_restore_corner,limit=1] data.saved_block_displays run function zbk:map_elements/custom_door/reset/restore_block_displays
execute unless entity @s[tag=purchased] if entity @e[tag=cd_restore_corner] if data entity @e[tag=cd_restore_corner,limit=1] data.saved_item_displays run data modify storage zbk:temp restore_ids set from entity @e[tag=cd_restore_corner,limit=1] data.saved_item_displays
execute unless entity @s[tag=purchased] if entity @e[tag=cd_restore_corner] if data entity @e[tag=cd_restore_corner,limit=1] data.saved_item_displays run function zbk:map_elements/custom_door/reset/restore_item_displays
tag @e[tag=cd_restore_corner] remove cd_restore_corner

# Remove purchased tag
tag @s remove purchased

# Kill old UI entities (matched by UID)
execute store result score #cd_sign_uid global run scoreboard players get @s cd_sign_uid
execute as @e[type=text_display,tag=custom_door_sign_ui,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run kill @s
execute as @e[type=interaction,tag=custom_door_sign_interaction,distance=..3] if score @s cd_sign_uid = #cd_sign_uid global run kill @s

# Recreate UI
function zbk:map_elements/custom_door/management/update_display
