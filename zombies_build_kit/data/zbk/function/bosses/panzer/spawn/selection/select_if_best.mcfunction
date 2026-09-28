# Select this marker if it is closer to a player than the current best marker.
# Runs as: panzer_spawner marker

execute if score @s panzer_spawn_dist < #panzer_best_dist temp run function zbk:bosses/panzer/spawn/selection/select_this_marker
