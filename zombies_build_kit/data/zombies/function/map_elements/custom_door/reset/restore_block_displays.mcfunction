# ===================================
# CUSTOM DOOR - RESTORE BLOCK DISPLAYS (RECURSIVE)
# ===================================
# Restores one block_display per call from storage zombies:temp restore_bds array
# Called from: reset/restore_zone, build_kit/load_zone

# Check if any entries remain
execute unless data storage zombies:temp restore_bds[0] run return 0

# Prepare position for macro
data modify storage zombies:temp bd_summon set value {x:0d,y:0d,z:0d}
data modify storage zombies:temp bd_summon.x set from storage zombies:temp restore_bds[0].x
data modify storage zombies:temp bd_summon.y set from storage zombies:temp restore_bds[0].y
data modify storage zombies:temp bd_summon.z set from storage zombies:temp restore_bds[0].z

# Summon at saved position
function zombies:map_elements/custom_door/reset/restore_bd_summon with storage zombies:temp bd_summon

# Merge block_state and transformation
data modify entity @e[type=block_display,tag=cd_restore_temp,limit=1] block_state set from storage zombies:temp restore_bds[0].block_state
data modify entity @e[type=block_display,tag=cd_restore_temp,limit=1] transformation set from storage zombies:temp restore_bds[0].transformation

# Assign door ID score so this BD can be found by tag+score
scoreboard players operation @e[type=block_display,tag=cd_restore_temp,limit=1] custom_door_id = #cd_sign_id global

# Cleanup temp tag
tag @e[type=block_display,tag=cd_restore_temp] remove cd_restore_temp

# Remove processed entry
data remove storage zombies:temp restore_bds[0]

# Recurse for next BD
function zombies:map_elements/custom_door/reset/restore_block_displays
