# Build Manager - Delete Explosive Barrel Entities
# Called as @s = the explosive_barrel marker, at @s = its position

# Kill the root display entity
# Saved block-display assemblies must lose their passengers before the root.
execute as @e[tag=explosive_barrel_display,distance=..3] on passengers run kill @s
kill @e[tag=explosive_barrel_display,distance=..3]

# Kill the interaction entity
kill @e[type=minecraft:interaction,tag=explosive_barrel_interaction,distance=..3]

# Reset barrel health score
scoreboard players reset @s barrel_health
tag @s remove explosive_barrel_exploded

# Kill the marker itself
kill @s
