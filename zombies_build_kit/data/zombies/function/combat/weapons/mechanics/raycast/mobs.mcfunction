# Small bullet
execute if score #spread_radius stats matches 0 run execute as @e[tag=!raycasting,type=!#zombies:not_mob,tag=!raycast_hit,tag=!combat_ignore,tag=!immune_guns,tag=!monkey_bomb_decoy,tag=!solo_down_decoy,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function zombies:combat/weapons/mechanics/raycast/collide

# Large Bullet
execute if score #spread_radius stats matches 1 run execute positioned ~-1 ~-0.5 ~-1 as @e[tag=!raycasting,type=!#zombies:not_mob,tag=!raycast_hit,tag=!combat_ignore,tag=!immune_guns,tag=!monkey_bomb_decoy,tag=!solo_down_decoy, dx=1, dy=0, dz=1] at @s run function zombies:combat/weapons/mechanics/raycast/collide
