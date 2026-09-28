# ===================================
# JUMP PAD - INITIALIZE
# ===================================
# Purpose: Reset jump pad system to default state
# Called from on_load.mcfunction and game reset
# ===================================

# Remove purchased tag from all jump pad markers
execute as @e[type=marker,tag=jump_pad,tag=jp_start] run tag @s remove purchased

# Add locked tag only to jump pads that require unlock (default behavior for markers without the field)
execute as @e[type=marker,tag=jump_pad,tag=jp_start] run tag @s add jp_locked
execute as @e[type=marker,tag=jump_pad,tag=jp_start] if data entity @s data{require_unlock:0} run tag @s remove jp_locked

# Set lamp states immediately and schedule a delayed retry to catch unloaded chunks
function zombies:map_elements/jump_pad/management/set_lamps
schedule function zombies:map_elements/jump_pad/management/set_lamps 5t

# Reset timers
scoreboard players reset @e[type=marker,tag=jump_pad,tag=jp_start] jump_pad_cooldown
scoreboard players reset @e[type=marker,tag=jump_pad,tag=jp_start] jump_pad_launch_timer

# Remove has_launched tag from all players
tag @a remove has_launched

# Kill any active launch arc armor stands
kill @e[tag=launch_arc]

# Kill old text displays and interaction entities
kill @e[type=text_display,tag=jump_pad_ui]
kill @e[type=interaction,tag=jump_pad_interaction]

# Respawn text displays and interaction entities for all jump pad start markers
execute as @e[type=marker,tag=jump_pad,tag=jp_start] at @s run function zombies:map_elements/jump_pad/purchasing/update_display

# Confirmation message (debug only)
function zombies:debug/info {f:"JUMP",m:"Jump pad system initialized"}
