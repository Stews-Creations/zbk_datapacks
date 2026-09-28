# ===================================
# DEBUG - EVENT LEVEL (Level 3+)
# ===================================
# Major game events (gold prefix, white text)
# Usage: function zbk:debug/event {f:"FEATURE",m:"message"}
# Parameters: f = feature tag, m = message

$execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[$(f)] ","color":"gold"},{"text":"$(m)","color":"white"}]
