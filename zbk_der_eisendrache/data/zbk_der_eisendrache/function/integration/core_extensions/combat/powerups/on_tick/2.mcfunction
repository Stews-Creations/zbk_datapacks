execute as @e[type=minecraft:item_display,tag=fuse] at @s as @p[dx=1,dy=1,dz=1,scores={de_fuse=1..}] run function zbk_der_eisendrache:combat/powerups/fuse/already_has
execute as @e[type=minecraft:item_display,tag=fuse] at @s as @p[dx=1,dy=1,dz=1,scores={de_fuse=0}] run function zbk_der_eisendrache:combat/powerups/fuse/pickup
