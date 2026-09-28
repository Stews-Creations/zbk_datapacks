# Launch attempts precede expiration for every pad; cooldowns advance after expiration.
# Grouping these global phases per pad would change overlapping-player eligibility.

# ===================================
# JUMP PAD MODULE - TICK
# ===================================
# Purpose: Execute jump pad arc animations and cooldown management
#
# Dependencies: map_elements/jump_pad/on_load.mcfunction
# ===================================

# ===== UNLOCK CHECK =====
# Check if players are standing on END markers to unlock jump pads
function zombies:map_elements/jump_pad/unlocking/check_end_markers

# Run move function for all active jump arc tracking markers
execute as @e[type=marker,tag=jump_arc] at @s run function zombies:map_elements/jump_pad/management/move

# ===== LAUNCH WINDOW MANAGEMENT (2 seconds after purchase) =====
# Decrement launch timer
execute as @e[type=marker,tag=jump_pad,tag=jp_start,scores={jump_pad_launch_timer=1..}] run scoreboard players remove @s jump_pad_launch_timer 1

# Call start function for each player in range (start function handles tagging and spawning)
execute as @e[type=marker,tag=jump_pad,tag=jp_start,scores={jump_pad_launch_timer=1..}] at @s as @a[distance=..1.75] run function zombies:map_elements/jump_pad/management/start

# When launch window expires (timer reaches 0)
execute as @e[type=marker,tag=jump_pad,tag=jp_start,scores={jump_pad_launch_timer=0}] at @s run function zombies:map_elements/jump_pad/management/expire_window
# Read cooldown from data.cooldown (seconds × 20 = ticks), fallback to 2400 ticks if unset

# ===== COOLDOWN MANAGEMENT =====
# Decrement cooldown timer for purchased jump pads (2 minutes = 2400 ticks)
execute as @e[type=marker,tag=jump_pad,tag=jp_start,tag=purchased,scores={jump_pad_cooldown=1..}] run scoreboard players remove @s jump_pad_cooldown 1

# When cooldown reaches 0, reset the jump pad
execute as @e[type=marker,tag=jump_pad,tag=jp_start,tag=purchased,scores={jump_pad_cooldown=0}] at @s run function zombies:map_elements/jump_pad/management/reset_single
