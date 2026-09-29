# === DELETE DOOR ===
# Kills the nearest door marker and all associated entities
# Also places open template to clear door blocks
# Handles all door subtypes: regular, gate, jump spot

# === Regular doors (not gate, not jump spot) ===
# Place door_down_4 template (fully open) based on orientation
execute at @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template zbk:doors/door_down_4 ~-1 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template zbk:doors/door_down_4 ~ ~ ~-1 none
execute at @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template zbk:doors/door_down_4 ~1 ~ ~ clockwise_90
execute at @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door,tag=!door_gate,tag=!door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template zbk:doors/door_down_4 ~ ~ ~1 180

# === Gate doors ===
# Place gate_door_up_5 template (fully open) with larger offsets
execute at @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template zbk:doors/gate_door_up_5 ~-3 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template zbk:doors/gate_door_up_5 ~ ~ ~-3 none
execute at @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template zbk:doors/gate_door_up_5 ~3 ~ ~ clockwise_90
execute at @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_gate,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template zbk:doors/gate_door_up_5 ~ ~ ~3 180

# === Jump spots ===
# Place jump_spot_down template (open state)
execute at @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template zbk:doors/jump_spot_down ~-1 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template zbk:doors/jump_spot_down ~ ~ ~-1 none
execute at @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template zbk:doors/jump_spot_down ~1 ~ ~ clockwise_90
execute at @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_jump_spot,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template zbk:doors/jump_spot_down ~ ~ ~1 180

# Kill text displays (2 per door - front and back)
kill @e[type=text_display,tag=door_text_display,distance=..5]
kill @e[type=text_display,tag=door_ui,distance=..5]

# Kill interactions (2 per door - front and back)
kill @e[type=interaction,tag=door_interaction,distance=..5]

# Kill display point markers (2 per door - front and back)
kill @e[type=marker,tag=door_display_point,distance=..5]

# Kill the main door marker
kill @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest]

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Door deleted.","color":"red"}]
