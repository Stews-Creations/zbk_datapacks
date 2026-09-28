# Suppress eligible players immediately upon entering the Start marker's launch radius.
execute as @e[type=minecraft:marker,tag=115_launch_start] at @s as @a[distance=..2,tag=de_ag_inside,tag=!de_ag_suppressed] at @s run function zbk_der_eisendrache:anti_gravity/suppression/apply

# Restore players who leave the radius before flight commits.
execute as @a[tag=de_ag_inside,tag=de_ag_suppressed,tag=!115_launch_flying] at @s unless entity @e[type=minecraft:marker,tag=115_launch_start,distance=..2] run function zbk_der_eisendrache:anti_gravity/suppression/release
