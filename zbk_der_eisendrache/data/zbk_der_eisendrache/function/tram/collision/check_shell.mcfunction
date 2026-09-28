# Runs as the nearest tram root at the root position. Tag the current grenade when it intersects a shell box.

# Main cabin floor.
execute positioned ~ ~-0.55 ~ run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=9,dy=1,dz=5,limit=1] add tram_collision_hit

# Long side walls. A three-block aperture around the modeled doorway keeps grenade throws practical.
execute positioned ~1 ~0.45 ~ run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=3,dy=3,dz=1,limit=1] add tram_collision_hit
execute positioned ~7 ~0.45 ~ run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=1,dy=3,dz=1,limit=1] add tram_collision_hit
execute positioned ~1 ~0.45 ~4 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=3,dy=3,dz=1,limit=1] add tram_collision_hit
execute positioned ~7 ~0.45 ~4 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=1,dy=3,dz=1,limit=1] add tram_collision_hit

# Cabin end walls.
execute positioned ~ ~0.45 ~1 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=1,dy=3,dz=3,limit=1] add tram_collision_hit
execute positioned ~8 ~0.45 ~1 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=1,dy=3,dz=3,limit=1] add tram_collision_hit

# Roof ring, leaving its central opening clear.
execute positioned ~ ~3.4 ~ run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=9,dy=1,dz=2,limit=1] add tram_collision_hit
execute positioned ~ ~3.4 ~3 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=9,dy=1,dz=2,limit=1] add tram_collision_hit
execute positioned ~ ~3.4 ~2 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=2,dy=1,dz=1,limit=1] add tram_collision_hit
execute positioned ~7 ~3.4 ~2 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=2,dy=1,dz=1,limit=1] add tram_collision_hit

# Tapered upper support assembled from the remaining display layers.
execute positioned ~1 ~4.4 ~2 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=6,dy=1.1,dz=2,limit=1] add tram_collision_hit
execute positioned ~2 ~5.4 ~2 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=4,dy=1.1,dz=2,limit=1] add tram_collision_hit
execute positioned ~3 ~6.4 ~2 run tag @e[type=minecraft:marker,tag=tram_collision_probe,dx=2,dy=3.1,dz=2,limit=1] add tram_collision_hit
