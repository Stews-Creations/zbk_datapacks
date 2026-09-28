# === LIGHT LINKED END MARKER LAMPS ===
# Executed as a jp_start marker. Finds the linked jp_end and lights its lamps.

execute store result score #temp_jp_id jump_pad_id run scoreboard players get @s jump_pad_id
execute as @e[type=marker,tag=jp_end] if score @s jump_pad_id = #temp_jp_id jump_pad_id if score #temp_jp_id jump_pad_id matches 1.. at @s run function zombies:map_elements/jump_pad/unlocking/light_lamps
