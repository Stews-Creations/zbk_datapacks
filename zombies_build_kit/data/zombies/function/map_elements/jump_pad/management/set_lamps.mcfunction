# ===================================
# JUMP PAD - SET LAMPS
# ===================================
# Purpose: Set lamp states based on lock status
# Scheduled after initialize to ensure chunks are loaded
# ===================================

# Turn off lamps at all START and END markers
execute as @e[type=marker,tag=jp_start] at @s run function zombies:map_elements/jump_pad/unlocking/unlight_lamps
execute as @e[type=marker,tag=jp_end] at @s run function zombies:map_elements/jump_pad/unlocking/unlight_lamps

# Light lamps for jump pads that don't require unlock (already usable)
execute as @e[type=marker,tag=jump_pad,tag=jp_start,tag=!jp_locked] at @s run function zombies:map_elements/jump_pad/unlocking/light_lamps
execute as @e[type=marker,tag=jump_pad,tag=jp_start,tag=!jp_locked] run function zombies:map_elements/jump_pad/unlocking/light_linked_end
