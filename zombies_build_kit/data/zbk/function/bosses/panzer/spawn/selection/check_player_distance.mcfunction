# Updates #panzer_marker_best_dist with this player's squared distance to the current marker.
# Runs as: player

execute store result score #panzer_player_x temp run data get entity @s Pos[0] 1
execute store result score #panzer_player_y temp run data get entity @s Pos[1] 1
execute store result score #panzer_player_z temp run data get entity @s Pos[2] 1

scoreboard players operation #panzer_dx temp = #panzer_player_x temp
scoreboard players operation #panzer_dx temp -= #panzer_marker_x temp
scoreboard players operation #panzer_dx temp *= #panzer_dx temp

scoreboard players operation #panzer_dy temp = #panzer_player_y temp
scoreboard players operation #panzer_dy temp -= #panzer_marker_y temp
scoreboard players operation #panzer_dy temp *= #panzer_dy temp

scoreboard players operation #panzer_dz temp = #panzer_player_z temp
scoreboard players operation #panzer_dz temp -= #panzer_marker_z temp
scoreboard players operation #panzer_dz temp *= #panzer_dz temp

scoreboard players operation #panzer_dist temp = #panzer_dx temp
scoreboard players operation #panzer_dist temp += #panzer_dy temp
scoreboard players operation #panzer_dist temp += #panzer_dz temp

execute if score #panzer_dist temp < #panzer_marker_best_dist temp run scoreboard players operation #panzer_marker_best_dist temp = #panzer_dist temp
