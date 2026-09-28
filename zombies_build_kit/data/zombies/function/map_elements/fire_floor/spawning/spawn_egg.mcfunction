# ===================================
# GIVE FIRE FLOOR MARKER SPAWN EGG
# ===================================
# Purpose: Give player a fire floor marker spawn egg
# Place eggs at stair locations where you want fire effects

# Give fire floor marker spawn egg
give @s minecraft:blaze_spawn_egg[custom_name=[{"text":"Fire Floor Marker","italic":false,"color":"red"}]] 64

# Instructions
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Fire Floor] ","color":"gold"},{"text":"Place marker eggs at each stair location in your floor pattern!","color":"yellow"}]
tellraw @s [{"text":"[Fire Floor] ","color":"gold"},{"text":"Right-click placed eggs to activate. Use ","color":"yellow"},{"text":"/trigger toggle_fire_floor","color":"aqua"},{"text":" to toggle effects on/off.","color":"yellow"}]
