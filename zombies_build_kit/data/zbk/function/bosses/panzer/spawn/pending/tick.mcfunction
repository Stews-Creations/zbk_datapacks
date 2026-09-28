# Counts down a delayed Panzer spawn marker.
# Runs as and at: marker tagged panzer_spawn_pending.

execute if score @s panzer_spawn_timer matches 1.. run scoreboard players remove @s panzer_spawn_timer 1
execute if score @s panzer_spawn_timer matches ..0 run function zbk:bosses/panzer/spawn/pending/summon_now
