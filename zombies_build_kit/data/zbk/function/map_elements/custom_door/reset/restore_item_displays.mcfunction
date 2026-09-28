# ===================================
# CUSTOM DOOR - RESTORE ITEM DISPLAYS (RECURSIVE)
# ===================================
# Restores one item_display per call from storage zbk:temp restore_ids array
# Called from: reset/restore_zone, reset/reset, build_kit/load_zone

# Check if any entries remain
execute unless data storage zbk:temp restore_ids[0] run return 0

# Prepare position for macro
data modify storage zbk:temp id_summon set value {x:0d,y:0d,z:0d}
data modify storage zbk:temp id_summon.x set from storage zbk:temp restore_ids[0].x
data modify storage zbk:temp id_summon.y set from storage zbk:temp restore_ids[0].y
data modify storage zbk:temp id_summon.z set from storage zbk:temp restore_ids[0].z

# Summon at saved position
function zbk:map_elements/custom_door/reset/restore_id_summon with storage zbk:temp id_summon

# Merge item, item_display, transformation, billboard
data modify entity @e[type=item_display,tag=cd_restore_id_temp,limit=1] item set from storage zbk:temp restore_ids[0].item
data modify entity @e[type=item_display,tag=cd_restore_id_temp,limit=1] item_display set from storage zbk:temp restore_ids[0].item_display
data modify entity @e[type=item_display,tag=cd_restore_id_temp,limit=1] transformation set from storage zbk:temp restore_ids[0].transformation
data modify entity @e[type=item_display,tag=cd_restore_id_temp,limit=1] billboard set from storage zbk:temp restore_ids[0].billboard

# Assign door ID score so this ID can be found by tag+score
scoreboard players operation @e[type=item_display,tag=cd_restore_id_temp,limit=1] custom_door_id = #cd_sign_id global

# Cleanup temp tag
tag @e[type=item_display,tag=cd_restore_id_temp] remove cd_restore_id_temp

# Remove processed entry
data remove storage zbk:temp restore_ids[0]

# Recurse for next ID
function zbk:map_elements/custom_door/reset/restore_item_displays
