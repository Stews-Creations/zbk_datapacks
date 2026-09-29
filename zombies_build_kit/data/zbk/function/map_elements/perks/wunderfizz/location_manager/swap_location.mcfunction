# Swap wunderfizz to a new location
# Called when max uses reached at current location

# Only proceed if there are multiple locations
execute unless score #wunderfizz_total_locations wunderfizz_id matches 2.. run return 0

# Deactivate current location
execute as @e[type=marker,tag=wunderfizz_active_location] run tag @s remove wunderfizz_active_location
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run scoreboard players set @s wunderfizz_ready 0
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run scoreboard players set @s wunderfizz_uses 0

# Turn off lamp at old location
execute as @e[type=marker,tag=wunderfizz,tag=!pm_v2] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id at @s run setblock ~ ~1 ~ redstone_lamp[lit=false]

# Hide text at old location
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id at @s run data modify entity @e[type=text_display,tag=wunderfizz_text_display,distance=..2,limit=1] text set value [{"text":""}]

# Find new location
function zbk:map_elements/perks/wunderfizz/location_manager/find_new_location

# Activate new location
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run tag @s add wunderfizz_active_location
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run scoreboard players set @s wunderfizz_ready 1
execute as @e[type=marker,tag=wunderfizz] if score @s wunderfizz_id = #wunderfizz_current_location wunderfizz_id run scoreboard players set @s wunderfizz_uses 0

# Set random max uses for this location (3-7)
execute store result score #wunderfizz_max_uses wunderfizz_uses run random value 3..7

# Play sound at new location
execute as @e[type=marker,tag=wunderfizz_active_location] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 0.5

# Debug message
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Wunderfizz] ","color":"light_purple"},{"text":"Location swapped to: ","color":"yellow"},{"score":{"name":"#wunderfizz_current_location","objective":"wunderfizz_id"},"color":"green"},{"text":" (will swap after ","color":"yellow"},{"score":{"name":"#wunderfizz_max_uses","objective":"wunderfizz_uses"},"color":"green"},{"text":" uses)","color":"yellow"}]
