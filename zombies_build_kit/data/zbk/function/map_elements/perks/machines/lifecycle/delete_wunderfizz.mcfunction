# Called after this machine's displays and blocks have been removed.
execute if entity @s[tag=wunderfizz_active_location] run tag @a remove wunderfizz_buyer
kill @s
scoreboard players set #wunderfizz_id_counter wunderfizz_id 0
scoreboard players set #wunderfizz_total_locations wunderfizz_id 0
execute as @e[type=marker,tag=wunderfizz] run function zbk:map_elements/perks/wunderfizz/location_manager/assign_sequential_id
execute as @e[type=marker,tag=wunderfizz_active_location,limit=1] run scoreboard players operation #wunderfizz_current_location wunderfizz_id = @s wunderfizz_id
execute unless entity @e[type=marker,tag=wunderfizz_active_location] run function zbk:map_elements/perks/wunderfizz/location_manager/init_system
execute as @e[type=marker,tag=pm_v2,distance=..4] at @s run function zbk:map_elements/perks/machines/collision/restore
