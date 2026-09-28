# Initialize wunderfizz location system on reload
# Called from on_load.mcfunction when datapack is reloaded

# Reset all location states
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_active_location
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_cycling
tag @e[type=marker,tag=wunderfizz] remove wunderfizz_claiming
execute as @e[type=marker,tag=wunderfizz] run scoreboard players set @s wunderfizz_uses 0
execute as @e[type=marker,tag=wunderfizz] run scoreboard players set @s wunderfizz_ready 1

# Reassign sequential IDs to all locations
scoreboard players set #wunderfizz_id_counter wunderfizz_id 0
execute as @e[type=marker,tag=wunderfizz] run function zbk:map_elements/perks/wunderfizz/location_manager/assign_sequential_id

# Pick random starting location
function zbk:map_elements/perks/wunderfizz/location_manager/init_system

# Debug message
function zbk:debug/info {f:"FIZZ",m:"Location system reinitialized on reload"}
