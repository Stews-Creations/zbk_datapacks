# Build Manager - Delete Radio Entities
# Called as @s = the radio_marker, at @s = its position
# Kills all display passengers, root display, interaction, and marker

# Tag all passengers riding the root display entity so we can kill them
execute as @e[type=minecraft:block_display,tag=radio_display,distance=..3] on passengers run tag @s add radio_cleanup

# Kill passengers first (children must die before parent)
kill @e[tag=radio_cleanup]

# Kill the root display entity
kill @e[type=minecraft:block_display,tag=radio_display,distance=..3]

# Kill the interaction entity
kill @e[type=minecraft:interaction,tag=radio_interaction,distance=..3]

# Kill the marker itself
kill @s
