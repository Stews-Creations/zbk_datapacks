# The marker faces inward. Separated sensors prevent a player from matching both sides.
execute positioned ^ ^ ^-2 as @a[distance=..1.9,tag=de_ag_inside] at @s run function zbk_der_eisendrache:anti_gravity/management/exit
execute positioned ^ ^ ^2 as @a[distance=..1.9,tag=!de_ag_inside] at @s run function zbk_der_eisendrache:anti_gravity/management/enter
