# Recovery runs before game start and between anti-gravity cycles, only on Der Eisendrache.
execute unless score #active zbk.de matches 1 run return 0
scoreboard players remove @a[scores={de_ag_bound_cd=1..}] de_ag_bound_cd 1
execute as @a at @s run function zbk_der_eisendrache:anti_gravity/boundary/player
