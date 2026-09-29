# === INITIALIZE DOOR ===
# Purpose: Set door system to default values
# Called from on_load.mcfunction and game reset
# Removes purchased tag and places the door structure based on orientation

# Remove purchased tag and reset animation timers
execute as @e[type=marker,tag=door] run tag @s remove purchased
execute as @e[type=marker,tag=door_powered] run tag @s remove purchased
scoreboard players reset @e[type=marker,tag=door] door_anim_timer
scoreboard players reset @e[type=marker,tag=door_powered] door_anim_timer

# Kill old text displays, interaction entities, and display point markers
kill @e[type=text_display,tag=door_ui]
kill @e[type=interaction,tag=door_interaction]
kill @e[type=marker,tag=door_display_point]

# Place door structure based on orientation
# South orientation (counterclockwise_90)
execute as @e[type=marker,tag=door,tag=door_south,tag=!door_gate,tag=!door_jump_spot] at @s run place template zbk:doors/door ~-1 ~ ~ counterclockwise_90
execute as @e[type=marker,tag=door_gate,tag=door_south] at @s run place template zbk:doors/gate_door ~-3 ~ ~ counterclockwise_90
execute as @e[type=marker,tag=door_jump_spot,tag=door_south] at @s run place template zbk:doors/jump_spot ~-1 ~ ~ counterclockwise_90
execute as @e[type=marker,tag=door_powered,tag=door_south,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church] at @s run place template zbk:doors/door_powered ~-1 ~ ~ counterclockwise_90
execute as @e[type=marker,tag=door_powered_stairs,tag=door_south] at @s run place template zbk:doors/powered_door_stairs ~-1 ~ ~ counterclockwise_90
execute as @e[type=marker,tag=door_powered_power_room,tag=door_south] at @s run place template zbk:doors/power_room_door ~-1 ~ ~ counterclockwise_90
execute as @e[type=marker,tag=door_powered_church,tag=door_south] at @s run place template zbk:doors/powered_church ~-1 ~ ~ counterclockwise_90

# West orientation (none)
execute as @e[type=marker,tag=door,tag=door_west,tag=!door_gate,tag=!door_jump_spot] at @s run place template zbk:doors/door ~ ~ ~-1 none
execute as @e[type=marker,tag=door_gate,tag=door_west] at @s run place template zbk:doors/gate_door ~ ~ ~-3 none
execute as @e[type=marker,tag=door_jump_spot,tag=door_west] at @s run place template zbk:doors/jump_spot ~ ~ ~-1 none
execute as @e[type=marker,tag=door_powered,tag=door_west,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church] at @s run place template zbk:doors/door_powered ~ ~ ~-1 none
execute as @e[type=marker,tag=door_powered_stairs,tag=door_west] at @s run place template zbk:doors/powered_door_stairs ~ ~ ~-1 none
execute as @e[type=marker,tag=door_powered_power_room,tag=door_west] at @s run place template zbk:doors/power_room_door ~ ~ ~-1 none
execute as @e[type=marker,tag=door_powered_church,tag=door_west] at @s run place template zbk:doors/powered_church ~ ~ ~-1 none

# North orientation (clockwise_90)
execute as @e[type=marker,tag=door,tag=door_north,tag=!door_gate,tag=!door_jump_spot] at @s run place template zbk:doors/door ~1 ~ ~ clockwise_90
execute as @e[type=marker,tag=door_gate,tag=door_north] at @s run place template zbk:doors/gate_door ~3 ~ ~ clockwise_90
execute as @e[type=marker,tag=door_jump_spot,tag=door_north] at @s run place template zbk:doors/jump_spot ~1 ~ ~ clockwise_90
execute as @e[type=marker,tag=door_powered,tag=door_north,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church] at @s run place template zbk:doors/door_powered ~1 ~ ~ clockwise_90
execute as @e[type=marker,tag=door_powered_stairs,tag=door_north] at @s run place template zbk:doors/powered_door_stairs ~1 ~ ~ clockwise_90
execute as @e[type=marker,tag=door_powered_power_room,tag=door_north] at @s run place template zbk:doors/power_room_door ~1 ~ ~ clockwise_90
execute as @e[type=marker,tag=door_powered_church,tag=door_north] at @s run place template zbk:doors/powered_church ~1 ~ ~ clockwise_90

# East orientation (180)
execute as @e[type=marker,tag=door,tag=door_east,tag=!door_gate,tag=!door_jump_spot] at @s run place template zbk:doors/door ~ ~ ~1 180
execute as @e[type=marker,tag=door_gate,tag=door_east] at @s run place template zbk:doors/gate_door ~ ~ ~3 180
execute as @e[type=marker,tag=door_jump_spot,tag=door_east] at @s run place template zbk:doors/jump_spot ~ ~ ~1 180
execute as @e[type=marker,tag=door_powered,tag=door_east,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church] at @s run place template zbk:doors/door_powered ~ ~ ~1 180
execute as @e[type=marker,tag=door_powered_stairs,tag=door_east] at @s run place template zbk:doors/powered_door_stairs ~ ~ ~1 180
execute as @e[type=marker,tag=door_powered_power_room,tag=door_east] at @s run place template zbk:doors/power_room_door ~ ~ ~1 180
execute as @e[type=marker,tag=door_powered_church,tag=door_east] at @s run place template zbk:doors/powered_church ~ ~ ~1 180

# Spawn text displays and interaction entities to show price
execute as @e[type=marker,tag=door,tag=!purchased] at @s run function zbk:map_elements/door/purchasable/display/update_display

# Confirmation message (debug only)
function zbk:debug/info {f:"DOOR",m:"Door system initialized"}
