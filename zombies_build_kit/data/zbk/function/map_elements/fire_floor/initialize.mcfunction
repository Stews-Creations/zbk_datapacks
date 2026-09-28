# ===================================
# FIRE FLOOR SUBMODULE - INITIALIZE
# ===================================
# Purpose: Set fire floor system to default values
# Called from on_load.mcfunction and toggle commands

# Set fire floor toggle to OFF (0) by default
# Players can enable it with /trigger toggle_fire_floor
execute unless score #fire_floor fire_floor_toggle matches 0.. run scoreboard players set #fire_floor fire_floor_toggle 0

execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Fire Floor] ","color":"gold"},{"text":"System initialized. Toggle is ","color":"green"},{"score":{"name":"#fire_floor","objective":"fire_floor_toggle"},"color":"yellow"}]
