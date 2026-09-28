execute as @e[type=item] if items entity @s contents minecraft:brick at @s run function zbk_der_eisendrache:events/powerup_fuse_drop
execute if entity @e[type=item_display,tag=fuse] run scoreboard players add #fuse_particle_tick tick 1
execute if score #fuse_particle_tick tick matches 6.. run scoreboard players set #fuse_particle_tick tick 0
execute if score #fuse_particle_tick tick matches 0 as @e[type=item_display,tag=fuse] at @s run particle minecraft:dust{color:[0.1,0.65,1.0],scale:0.8} ~ ~ ~ 0.25 0.2 0.25 0 1 force
execute if score #fuse_particle_tick tick matches 0 as @e[type=item_display,tag=fuse] at @s run particle minecraft:electric_spark ~ ~ ~ 0.15 0.12 0.15 0.01 1 force
