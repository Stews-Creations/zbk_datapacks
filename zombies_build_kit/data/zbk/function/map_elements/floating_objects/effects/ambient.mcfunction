# Keep audio in a player pass: overlapping centers must not duplicate the sound for one listener.

# Render the anti-gravity area's ambient particles and sound.
execute at @e[type=marker,tag=anti_gravity_center] run function zbk:map_elements/floating_objects/effects/at_center

execute as @a[gamemode=adventure] at @s if entity @e[type=marker,tag=anti_gravity_center,distance=..25] run playsound minecraft:block.beacon.ambient master @s ~ ~ ~ 0.7 1.3
