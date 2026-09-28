# Score this marker by the distance to its closest active player.
# Runs as: panzer_spawner marker

scoreboard players set #panzer_marker_best_dist temp 2000000000
execute store result score #panzer_marker_x temp run data get entity @s Pos[0] 1
execute store result score #panzer_marker_y temp run data get entity @s Pos[1] 1
execute store result score #panzer_marker_z temp run data get entity @s Pos[2] 1

execute as @a[gamemode=adventure,team=!downed] run function zbk:bosses/panzer/spawn/selection/check_player_distance

scoreboard players operation @s panzer_spawn_dist = #panzer_marker_best_dist temp
