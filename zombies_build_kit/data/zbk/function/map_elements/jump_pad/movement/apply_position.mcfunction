# Apply calculated position to the armor stand vehicle
# Executed as tracking marker with arc data and calculated position

# Get the player ID from this marker
execute store result score #current_player_id arc_calc run data get entity @s data.player_id

# Store calculated position in storage for macro tp
data modify storage zbk:temp jump_arc_pos set value {x:0.0d,y:0.0d,z:0.0d}
execute store result storage zbk:temp jump_arc_pos.x double 0.001 run scoreboard players get @s arc_pos_x
# Subtract 1500 (1.5 blocks when scaled by 1000) to lower armor stand
scoreboard players operation #adjusted_y arc_calc = @s arc_pos_y
scoreboard players remove #adjusted_y arc_calc 1500
execute store result storage zbk:temp jump_arc_pos.y double 0.001 run scoreboard players get #adjusted_y arc_calc
execute store result storage zbk:temp jump_arc_pos.z double 0.001 run scoreboard players get @s arc_pos_z

# Teleport armor stand vehicle (player rides along)
execute as @e[type=armor_stand,tag=jump_arc_vehicle] if score @s id = #current_player_id arc_calc run function zbk:map_elements/jump_pad/movement/tp_arc with storage zbk:temp jump_arc_pos
