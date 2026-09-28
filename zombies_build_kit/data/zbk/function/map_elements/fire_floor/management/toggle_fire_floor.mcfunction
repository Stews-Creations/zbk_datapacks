# ===================================
# TOGGLE FIRE FLOOR EFFECTS
# ===================================
# Purpose: Toggle all fire floor particle effects on/off globally
# Triggered by: /trigger toggle_fire_floor

# Store current state in temp variable
scoreboard players operation #temp fire_floor_toggle = #fire_floor fire_floor_toggle

# Toggle the fire floor state (0 = OFF, 1 = ON)
execute if score #temp fire_floor_toggle matches 0 run scoreboard players set #fire_floor fire_floor_toggle 1
execute if score #temp fire_floor_toggle matches 1 run scoreboard players set #fire_floor fire_floor_toggle 0

# Provide feedback based on NEW state
execute if score #fire_floor fire_floor_toggle matches 1 run tellraw @s [{"text":"[Fire Floor] ","color":"gold"},{"text":"Fire effects ","color":"green"},{"text":"ENABLED","color":"red","bold":true}]
execute if score #fire_floor fire_floor_toggle matches 1 at @s run playsound minecraft:block.fire.ambient master @s ~ ~ ~ 1 0.5

execute if score #fire_floor fire_floor_toggle matches 0 run tellraw @s [{"text":"[Fire Floor] ","color":"gold"},{"text":"Fire effects ","color":"green"},{"text":"DISABLED","color":"gray"}]
execute if score #fire_floor fire_floor_toggle matches 0 at @s run playsound minecraft:block.fire.extinguish master @s ~ ~ ~ 1 1
