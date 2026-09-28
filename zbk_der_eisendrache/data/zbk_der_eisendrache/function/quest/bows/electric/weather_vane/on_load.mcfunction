# Definitions exist before selecting Der Eisendrache. One snapshot chunk is reserved below Z=0.
scoreboard objectives add de_el_stage dummy
scoreboard objectives add de_el_timer dummy
scoreboard objectives add de_el_walls dummy
scoreboard objectives add de_el_broken dummy
execute in zombies:door_storage run forceload add 0 -1024
