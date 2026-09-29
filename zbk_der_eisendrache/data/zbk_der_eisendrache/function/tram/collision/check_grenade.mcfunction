# Runs as the active grenade marker at its exact physics sub-step position.
execute unless entity @s[type=minecraft:marker,tag=active_grenade,tag=!exploded] run return 0
tag @s add tram_collision_probe
tag @s remove tram_collision_hit

# Evaluate only the closest tram root; configured routes do not overlap.
execute as @e[type=minecraft:block_display,tag=tram_route_display,sort=nearest,limit=1] at @s run function zbk_der_eisendrache:tram/collision/check_shell

# Restore grenade position before using the standard explosion lifecycle.
execute if entity @s[tag=tram_collision_hit] at @s run function zbk:combat/weapons/grenade/effects/explode
tag @s remove tram_collision_probe
tag @s remove tram_collision_hit
