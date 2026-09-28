# === SAVE ITEM DISPLAYS (RECURSIVE) ===
# Saves one tagged item_display per call, appends to Corner 1's saved_item_displays array

# Check if any tagged IDs remain
execute unless entity @e[type=item_display,tag=cd_save_id,limit=1] run return 0

# Create entry with position + item + item_display + transformation
data modify storage zombies:temp id_entry set value {}

# Use float_origin (clean position) if available, otherwise use current Pos
execute if data entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin run data modify storage zombies:temp id_entry.x set from entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin[0]
execute if data entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin run data modify storage zombies:temp id_entry.y set from entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin[1]
execute if data entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin run data modify storage zombies:temp id_entry.z set from entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin[2]
execute unless data entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin run data modify storage zombies:temp id_entry.x set from entity @e[type=item_display,tag=cd_save_id,limit=1] Pos[0]
execute unless data entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin run data modify storage zombies:temp id_entry.y set from entity @e[type=item_display,tag=cd_save_id,limit=1] Pos[1]
execute unless data entity @e[type=item_display,tag=cd_save_id,limit=1] data.float_origin run data modify storage zombies:temp id_entry.z set from entity @e[type=item_display,tag=cd_save_id,limit=1] Pos[2]

data modify storage zombies:temp id_entry.item set from entity @e[type=item_display,tag=cd_save_id,limit=1] item
data modify storage zombies:temp id_entry.item_display set from entity @e[type=item_display,tag=cd_save_id,limit=1] item_display
data modify storage zombies:temp id_entry.transformation set from entity @e[type=item_display,tag=cd_save_id,limit=1] transformation
data modify storage zombies:temp id_entry.billboard set from entity @e[type=item_display,tag=cd_save_id,limit=1] billboard
data modify storage zombies:temp id_entry.Tags set from entity @e[type=item_display,tag=cd_save_id,limit=1] Tags

# Append to Corner 1's saved array
data modify entity @e[tag=cd_save_target,limit=1] data.saved_item_displays append from storage zombies:temp id_entry

# Untag this ID
tag @e[type=item_display,tag=cd_save_id,limit=1] remove cd_save_id

# Recurse for next ID
function zombies:build_kit/management/custom_door/zone/save_item_displays
