# === CUSTOM DOOR FLOAT - TICK ===
# Applies hover/sway movement and particles to floating block displays

# Hover + sway movement
execute as @e[type=block_display,tag=cd_float_bd] at @s run function zombies:map_elements/custom_door/float/tick_float_bd
execute as @e[type=item_display,tag=cd_float_id] at @s run function zombies:map_elements/custom_door/float/tick_float_bd

# Particles at each center marker (zone-sized spread via macro)
execute as @e[type=marker,tag=cd_float_center] at @s if entity @a[distance=..22.4] run function zombies:map_elements/custom_door/float/particles with entity @s data.float_params

# Beacon ambient sound (once per cycle for nearby adventure players)
execute if score #tick tick matches 0 as @a[gamemode=adventure] at @s if entity @e[type=marker,tag=cd_float_center,distance=..25] run playsound minecraft:block.beacon.ambient master @s ~ ~ ~ 0.7 1.3
