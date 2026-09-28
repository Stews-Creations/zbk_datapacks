# === INITIAL POWER ON ===
# Called when lever is flipped for the first time
execute if score #power power matches 1 run return 0

# Set power to 1
scoreboard players set #power power 1

# Visual effects at the lever location
execute as @e[type=marker,tag=power_marker] at @s run particle minecraft:electric_spark ~ ~1 ~ 1 1 1 0.1 100 force
execute as @e[type=marker,tag=power_marker] at @s run particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force
execute as @e[type=marker,tag=power_marker] at @s run particle minecraft:firework ~ ~1 ~ 1 1 1 0.2 50 force

# Update lamps
execute as @e[type=marker,tag=power_marker] at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:redstone_lamp[lit=true] replace minecraft:redstone_lamp
function zbk:map_elements/blocks/management/set_lit

# Sounds
function zbk:sounds/play/power_on
execute as @e[type=marker,tag=power_marker] at @s run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1.2
execute as @e[type=marker,tag=power_marker] at @s run playsound minecraft:item.trident.thunder master @a ~ ~ ~ 1 0.9

# Debug message
function zbk:debug/event {f:"POWER",m:"Power activated!"}

# Open all powered doors (delegate to door module)
execute as @e[type=marker,tag=door_powered] at @s run function zbk:map_elements/door/powered/open

# Open all custom power doors
execute as @e[type=marker,tag=custom_door_1,scores={custom_door_power=1}] run function zbk:map_elements/custom_door/management/power_open

# Fire power on signals
function zbk:map_elements/game_signals/runtime/fire_power_on

function zbk:dispatch/power_on
