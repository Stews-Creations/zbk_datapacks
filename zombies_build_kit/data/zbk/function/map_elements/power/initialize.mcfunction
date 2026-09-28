# === INITIALIZE POWER ===
# Purpose: Set power system to default values
# Called from on_load.mcfunction and game reset

# Turn power off
scoreboard players set #power power 0

# Reset power signals
function zbk:map_elements/game_signals/runtime/fire_power_off

# Reset lever
function zbk:map_elements/power/management/place_lever
# Update lamps
execute as @e[type=marker,tag=power_marker] at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 minecraft:redstone_lamp[lit=false] replace minecraft:redstone_lamp
# If power is not required, silently turn it on
execute if score #power_required power matches 0 run function zbk:map_elements/power/management/silent_on

# Inform player
function zbk:debug/info {f:"POWER",m:"Power system initialized"}
