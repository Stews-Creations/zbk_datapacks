# Keep forward travel, reverse travel, and automatic return as distinct phases.
# Player tags and timers changed by one direction must remain visible to the following phases.

# ===================================
# TELEPORTER MODULE - TICK
# ===================================
# Purpose: Handle teleporter duration countdowns, cooldowns, and spawn egg detection
#
# Dependencies: map_elements/teleporter/on_load.mcfunction
# ===================================

# ===== SPAWN EGG DETECTION =====
# Detect placed endermite spawn eggs and convert to markers
execute if entity @e[type=minecraft:endermite,name="Teleporter Start"] run function zombies:map_elements/teleporter/spawning/spawn_start
execute if entity @e[type=minecraft:endermite,name="Teleporter End"] run function zombies:map_elements/teleporter/spawning/spawn_end
execute if entity @e[type=minecraft:endermite,name="Teleporter Auto Return"] run function zombies:map_elements/teleporter/spawning/spawn_auto_return

# ===== ACTIVATION PARTICLES =====
# Electric sparks, purple particles, and end rod sparkles at both pads (only while tp_active)
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_active] at @s run function zombies:map_elements/teleporter/management/activation_particles

# ===== DURATION COUNTDOWN =====
# Decrement duration timer for active teleporters
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_active,scores={teleporter_duration=1..}] run scoreboard players remove @s teleporter_duration 1

# When duration reaches 0, dispatch based on direction
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_active,tag=!tp_reverse,scores={teleporter_duration=0}] at @s run function zombies:map_elements/teleporter/management/teleport
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_active,tag=tp_reverse,scores={teleporter_duration=0}] at @s run function zombies:map_elements/teleporter/management/teleport_return

# ===== RECHARGE DELAY =====
# Decrement recharge delay timer for purchased teleporters waiting to play recharging sound
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_purchased] at @s run function zombies:map_elements/teleporter/management/recharge_tick

# When delay reaches 0, play recharging sound at both markers

# ===== AUTO RETURN =====
# Warn riders during the final 5 seconds before auto-return
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_auto_return_pending,scores={teleporter_auto_return=1..100}] at @s run function zombies:map_elements/teleporter/management/auto_return_warning

# Decrement auto-return timer for teleporters waiting to send riders back
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_auto_return_pending,scores={teleporter_auto_return=1..}] run scoreboard players remove @s teleporter_auto_return 1

# When auto-return timer reaches 0, send tagged riders to the linked auto-return marker
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_auto_return_pending,scores={teleporter_auto_return=0}] at @s run function zombies:map_elements/teleporter/management/auto_return

# ===== COOLDOWN =====
# Decrement cooldown timer for purchased teleporters
execute as @e[type=marker,tag=teleporter,tag=tp_start,tag=tp_purchased] at @s run function zombies:map_elements/teleporter/management/cooldown_tick

# When cooldown reaches 0, reset the teleporter
