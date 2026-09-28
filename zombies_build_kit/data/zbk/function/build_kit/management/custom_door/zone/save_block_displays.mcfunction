# === SAVE BLOCK DISPLAYS (RECURSIVE) ===
# Saves one tagged block_display per call, appends to Corner 1's saved_block_displays array

# Check if any tagged BDs remain
execute unless entity @e[type=block_display,tag=cd_save_bd,limit=1] run return 0

# Create entry with position + block_state + transformation
data modify storage zbk:temp bd_entry set value {}

# Use float_origin (clean position) if available, otherwise use current Pos
execute if data entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin run data modify storage zbk:temp bd_entry.x set from entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin[0]
execute if data entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin run data modify storage zbk:temp bd_entry.y set from entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin[1]
execute if data entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin run data modify storage zbk:temp bd_entry.z set from entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin[2]
execute unless data entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin run data modify storage zbk:temp bd_entry.x set from entity @e[type=block_display,tag=cd_save_bd,limit=1] Pos[0]
execute unless data entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin run data modify storage zbk:temp bd_entry.y set from entity @e[type=block_display,tag=cd_save_bd,limit=1] Pos[1]
execute unless data entity @e[type=block_display,tag=cd_save_bd,limit=1] data.float_origin run data modify storage zbk:temp bd_entry.z set from entity @e[type=block_display,tag=cd_save_bd,limit=1] Pos[2]

data modify storage zbk:temp bd_entry.block_state set from entity @e[type=block_display,tag=cd_save_bd,limit=1] block_state
data modify storage zbk:temp bd_entry.transformation set from entity @e[type=block_display,tag=cd_save_bd,limit=1] transformation
data modify storage zbk:temp bd_entry.Tags set from entity @e[type=block_display,tag=cd_save_bd,limit=1] Tags

# Append to Corner 1's saved array
data modify entity @e[tag=cd_save_target,limit=1] data.saved_block_displays append from storage zbk:temp bd_entry

# Untag this BD
tag @e[type=block_display,tag=cd_save_bd,limit=1] remove cd_save_bd

# Recurse for next BD
function zbk:build_kit/management/custom_door/zone/save_block_displays
