# ===================================
# DEBUG - INFO LEVEL (Level 4+)
# ===================================
# Standard info messages (aqua prefix, green text)
# Usage: function zombies:debug/info {f:"FEATURE",m:"message"}
# Parameters: f = feature tag, m = message

$execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[$(f)] ","color":"aqua"},{"text":"$(m)","color":"green"}]
