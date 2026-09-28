# ===================================
# JUMP PAD - CHECK END MARKERS FOR UNLOCK
# ===================================
# Purpose: Detect players near END markers to unlock matching START markers
# Called from: on_tick.mcfunction
# ===================================

# Check for players within 1.5 blocks of linked END markers
execute as @e[type=marker,tag=jp_end,tag=!jp_unlinked] at @s if entity @a[distance=..1.5] run function zombies:map_elements/jump_pad/unlocking/unlock_start
