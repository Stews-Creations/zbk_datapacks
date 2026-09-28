# ===================================
# EXPLOSIVE BARREL - RESPAWN DISPLAY
# ===================================
# Purpose: Re-summon display and interaction entities for a single barrel
# Called as @s = the explosive_barrel marker, at @s = its position
# Used by: initialize and Build Kit reset commands

# Clean up any leftover display/interaction entities first
# Saved block-display assemblies must lose their passengers before the root.
execute as @e[tag=explosive_barrel_display,distance=..3] on passengers run kill @s
kill @e[tag=explosive_barrel_display,distance=..3]
kill @e[type=minecraft:interaction,tag=explosive_barrel_interaction,distance=..3]

# Reset health and state
scoreboard players set @s barrel_health 100
tag @s remove explosive_barrel_exploded

# Re-summon display and interaction entities
function zombies:map_elements/explosive_barrel/spawning/spawn_displays
