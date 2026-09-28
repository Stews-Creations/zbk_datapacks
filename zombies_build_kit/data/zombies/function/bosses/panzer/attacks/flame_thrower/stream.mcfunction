# Panzer flamethrower particles and hit checks.
# Runs as: panzer_ai iron golem, positioned at the nozzle and facing the target.

particle minecraft:small_flame ^ ^ ^0.35 0.08 0.08 0.08 0.02 2 force
particle minecraft:flame ^ ^ ^1.1 0.14 0.1 0.14 0.03 3 force
particle minecraft:flame ^ ^ ^2.0 0.18 0.12 0.18 0.035 4 force
particle minecraft:flame ^ ^ ^3.1 0.24 0.16 0.24 0.04 4 force
particle minecraft:flame ^ ^ ^4.3 0.3 0.2 0.3 0.04 5 force
particle minecraft:flame ^ ^ ^5.6 0.36 0.23 0.36 0.045 5 force
particle minecraft:flame ^ ^ ^7.0 0.42 0.27 0.42 0.045 5 force
particle minecraft:flame ^ ^ ^8.5 0.5 0.3 0.5 0.05 5 force
particle minecraft:flame ^ ^ ^10.1 0.58 0.34 0.58 0.05 5 force
particle minecraft:smoke ^ ^ ^3.2 0.25 0.15 0.25 0.015 2 force
particle minecraft:smoke ^ ^ ^6.4 0.45 0.25 0.45 0.02 2 force
particle minecraft:smoke ^ ^ ^9.4 0.55 0.32 0.55 0.02 2 force
particle minecraft:lava ^ ^ ^5.0 0.25 0.14 0.25 0 1 force

execute positioned ^ ^-0.9 ^1.3 as @a[gamemode=adventure,team=!downed,distance=..1.15] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:1.3}
execute positioned ^ ^-0.9 ^2.7 as @a[gamemode=adventure,team=!downed,distance=..1.25] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:2.7}
execute positioned ^ ^-0.9 ^4.1 as @a[gamemode=adventure,team=!downed,distance=..1.4] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:4.1}
execute positioned ^ ^-0.9 ^5.6 as @a[gamemode=adventure,team=!downed,distance=..1.55] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:5.6}
execute positioned ^ ^-0.9 ^7.2 as @a[gamemode=adventure,team=!downed,distance=..1.7] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:7.2}
execute positioned ^ ^-0.9 ^8.8 as @a[gamemode=adventure,team=!downed,distance=..1.85] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:8.8}
execute positioned ^ ^-0.9 ^10.3 as @a[gamemode=adventure,team=!downed,distance=..2] run function zombies:bosses/panzer/attacks/flame_thrower/try_apply_hit {distance:10.3}
