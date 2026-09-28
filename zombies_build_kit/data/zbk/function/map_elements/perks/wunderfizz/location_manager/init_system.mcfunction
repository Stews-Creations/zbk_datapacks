# Initialize wunderfizz location system
# Picks a random location marker and activates it

# Count total locations (in case #wunderfizz_total_locations wasn't set yet)
execute store result score #wunderfizz_total_locations wunderfizz_id if entity @e[type=marker,tag=wunderfizz]

# Only proceed if there are wunderfizz locations
execute unless score #wunderfizz_total_locations wunderfizz_id matches 1.. run return 0

# Generate random location ID (1 to total_locations)
execute store result score #wunderfizz_current_location wunderfizz_id run random value 1..2147483647
scoreboard players operation #wunderfizz_current_location wunderfizz_id %= #wunderfizz_total_locations wunderfizz_id
scoreboard players add #wunderfizz_current_location wunderfizz_id 1

# Activate the selected location
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run tag @s add wunderfizz_active_location
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run scoreboard players set @s wunderfizz_ready 1

# Debug message (debug only)
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Wunderfizz] ","color":"light_purple"},{"text":"Location system initialized. Active location ID: ","color":"green"},{"score":{"name":"#wunderfizz_current_location","objective":"wunderfizz_id"},"color":"yellow"},{"text":" / Total: ","color":"green"},{"score":{"name":"#wunderfizz_total_locations","objective":"wunderfizz_id"},"color":"yellow"}]
