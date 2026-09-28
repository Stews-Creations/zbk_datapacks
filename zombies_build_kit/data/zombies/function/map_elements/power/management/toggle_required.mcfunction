# === TOGGLE POWER REQUIRED ===
# Toggles whether the map requires players to flip the power switch

# Snapshot current value
scoreboard players set #temp global 0
execute if score #power_required power matches 1 run scoreboard players set #temp global 1

# Was required (1) -> not required (0)
execute if score #temp global matches 1 run scoreboard players set #power_required power 0
execute if score #temp global matches 1 run tellraw @s [{"text":"[Power] ","color":"gold"},{"text":"Power Required: ","color":"green"},{"text":"OFF","color":"red","bold":true},{"text":" (power will be ON at game start)","color":"gray"}]
# Power always on: activate toggle signals, keep pulse idle (fires on game start)
execute if score #temp global matches 1 as @e[type=marker,tag=signal_power_on,tag=signal_toggle] at @s run setblock ~ ~ ~ redstone_block
execute if score #temp global matches 1 as @e[type=marker,tag=signal_power_on,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete

# Was not required (0) -> required (1)
execute if score #temp global matches 0 run scoreboard players set #power_required power 1
execute if score #temp global matches 0 run tellraw @s [{"text":"[Power] ","color":"gold"},{"text":"Power Required: ","color":"green"},{"text":"ON","color":"aqua","bold":true},{"text":" (players must flip the switch)","color":"gray"}]
# Power must be earned: reset all power signals to idle
execute if score #temp global matches 0 as @e[type=marker,tag=signal_power_on,tag=signal_toggle] at @s run setblock ~ ~ ~ red_concrete
execute if score #temp global matches 0 as @e[type=marker,tag=signal_power_on,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete
