# ===================================
# CREATE FIRE FLOOR MARKER
# ===================================
# Purpose: Convert spawn egg to permanent fire floor marker
# Triggered by right-clicking a blaze spawn egg with "Fire Floor Marker" name

# Create permanent marker at the spawn egg location
execute as @e[type=blaze,name="Fire Floor Marker"] at @s run summon marker ~ ~ ~ {Tags:["fire_floor_marker"]}

# Visual feedback
execute as @e[type=blaze,name="Fire Floor Marker"] at @s run particle flame ~ ~1 ~ 0.3 0.3 0.3 0.05 20 force
execute as @e[type=blaze,name="Fire Floor Marker"] at @s run playsound minecraft:block.fire.ambient master @a ~ ~ ~ 1 0.8

# Message
execute as @e[type=blaze,name="Fire Floor Marker"] at @s run execute as @a[distance=..15,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Fire Floor] ","color":"gold"},{"text":"Fire floor marker created!","color":"green"}]

# Remove the spawn egg entity
kill @e[type=blaze,name="Fire Floor Marker"]
