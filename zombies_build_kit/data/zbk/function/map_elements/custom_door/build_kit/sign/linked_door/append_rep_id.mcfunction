# === APPEND REPRESENTATIVE ID ===
# Runs as a group representative. Appends its custom_door_id to ld_new_list.

execute store result storage zbk:temp ld_temp_id int 1 run scoreboard players get @s custom_door_id
data modify storage zbk:temp ld_new_list append from storage zbk:temp ld_temp_id
