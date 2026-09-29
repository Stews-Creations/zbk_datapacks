# ===================================
# BUILD KIT - TRAP CONFIG DIALOG
# ===================================
# Purpose: Open configuration dialog for electric trap.
# Uses distance-based selection (like other build kit dialogs).
# ===================================

# Defaults
scoreboard players set #current_cost global 1000
scoreboard players set #current_duration global 30
scoreboard players set #current_cooldown global 45

# Cleanup stale open tags from dispatcher.
tag @e[tag=open_dialog] remove open_dialog

# Read current values from nearest trap entities.
execute if entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] store result score #current_cost global run data get entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] data.cost
execute if score #current_cost global matches 0 if entity @e[type=marker,tag=trap_corner,distance=..20,limit=1,sort=nearest] store result score #current_cost global run data get entity @e[type=marker,tag=trap_corner,distance=..20,limit=1,sort=nearest] data.cost
execute if score #current_cost global matches 0 run scoreboard players set #current_cost global 1000

execute if entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] store result score #current_duration global run data get entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] data.duration
execute if entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] store result score #current_cooldown global run data get entity @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] data.cooldown
# Fallback: read from trap_control if sign doesn't have the values
execute if score #current_duration global matches 0 if entity @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] store result score #current_duration global run data get entity @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] data.duration
execute if score #current_cooldown global matches 0 if entity @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] store result score #current_cooldown global run data get entity @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] data.cooldown

# Store data for macro dialog.
data modify storage zbk:temp trap_dialog set value {cost:1000,duration:30,cooldown:45,d:"$"}
execute store result storage zbk:temp trap_dialog.cost int 1 run scoreboard players get #current_cost global
execute store result storage zbk:temp trap_dialog.duration int 1 run scoreboard players get #current_duration global
execute store result storage zbk:temp trap_dialog.cooldown int 1 run scoreboard players get #current_cooldown global

# Open dialog
function zbk:map_elements/traps/electric/build_kit/dialogs/show_config_dialog with storage zbk:temp trap_dialog
