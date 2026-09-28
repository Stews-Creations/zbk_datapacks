# ===================================
# DEBUG - ERROR LEVEL (Level 1+)
# ===================================
# Error messages (red prefix, red text)
# Usage: function zbk:debug/error {f:"FEATURE",m:"message"}
# Parameters: f = feature tag, m = message

$execute as @a[tag=debug,scores={debug_level=1..}] run tellraw @s [{"text":"[$(f)] ","color":"red"},{"text":"$(m)","color":"red"}]
