# DE fuse candidate: use Core's shared cap/weighted-drop gate, then consume through the map-owned Fuse implementation.
execute unless score #active zbk.de matches 1 run return run kill @s
execute unless score #global game_active matches 1.. run return run kill @s
execute if score #global de_fuse matches 0 if function zbk:api/powerups/can_spawn run return run function zbk_der_eisendrache:combat/powerups/fuse/spawn
kill @s
