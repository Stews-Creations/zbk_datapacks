# ===================================
# DEBUG - WARN LEVEL (Level 2+)
# ===================================
# Warning messages (gold prefix, yellow text)
# Usage: function zombies:debug/warn {f:"FEATURE",m:"message"}
# Parameters: f = feature tag, m = message

$execute as @a[tag=debug,scores={debug_level=2..}] run tellraw @s [{"text":"[$(f)] ","color":"gold"},{"text":"$(m)","color":"yellow"}]
