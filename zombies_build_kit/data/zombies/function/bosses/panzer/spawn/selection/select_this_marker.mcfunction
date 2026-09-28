# Marks this Panzer spawner as the selected spawn location.
# Runs as: panzer_spawner marker

tag @e[type=minecraft:marker,tag=panzer_spawn_selected] remove panzer_spawn_selected
tag @s add panzer_spawn_selected
scoreboard players operation #panzer_best_dist temp = @s panzer_spawn_dist
