# === DELETE MYSTERY BOX ===
# Kills the nearest mystery box location and all associated entities
# (block displays with parent/child, interaction, marker, barriers)

# Kill block display passengers (children) first, then all parents
execute as @e[type=block_display,tag=mystery_box,distance=..5] on passengers run kill @s
kill @e[type=block_display,tag=mystery_box,distance=..5]

# Kill interaction
kill @e[type=interaction,tag=mystery_box_interaction,distance=..5,limit=1,sort=nearest]

# Remove barrier blocks placed by the template (3 barriers in a row)
execute at @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] run fill ~-1 ~ ~-1 ~1 ~ ~1 air replace barrier

# Kill the location marker
kill @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest]

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Mystery box deleted.","color":"red"}]
