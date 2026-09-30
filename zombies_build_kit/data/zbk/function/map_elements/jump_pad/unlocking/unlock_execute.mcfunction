# ===================================
# JUMP PAD - EXECUTE UNLOCK
# ===================================
# Purpose: Unlock the START marker, light lamps, play sound
# Executed as: START marker (with position context from unlock_start)
# ===================================

# Remove locked tag
tag @s remove jp_locked

# Show text display
execute at @s as @e[type=text_display,tag=jump_pad_text_display,distance=..2,limit=1] run data remove entity @s text_opacity

# Light lamps at START marker
function zbk:map_elements/jump_pad/unlocking/light_lamps

# Light lamps at END marker
execute store result score #unlock_jp_id jump_pad_id run scoreboard players get @s jump_pad_id
execute as @e[type=marker,tag=jp_end] if score @s jump_pad_id = #unlock_jp_id jump_pad_id at @s run function zbk:map_elements/jump_pad/unlocking/light_lamps

# Play sound at END marker (where player is standing)
execute as @e[type=marker,tag=jp_end] if score @s jump_pad_id = #unlock_jp_id jump_pad_id at @s run function zbk:map_elements/jump_pad/audio/jump_pad_unlocked

# Notify players
tellraw @a[tag=debug] [{"text":"[JUMP PAD] ","color":"aqua"},{"text":"Jump pad unlocked!","color":"green"}]
