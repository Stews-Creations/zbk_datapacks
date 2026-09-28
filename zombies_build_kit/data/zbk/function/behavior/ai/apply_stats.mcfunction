# === APPLY ZOMBIE STATS ===
# Purpose: Apply calculated health and damage to newly spawned zombie
# Called immediately after zombie summoning

# Set attack damage (6.67 = 3.335 hearts)
attribute @s minecraft:attack_damage base set 6.67

# Set max health to calculated value (stored in wave.health)
execute store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run scoreboard players get #global wave.health

# Set current health to match max health
execute store result entity @s Health float 1 run scoreboard players get #global wave.health

# Apply randomized round-based speed
function zbk:behavior/ai/apply_speed

# Remove the needs_stats tag
tag @s remove needs_stats
