# Remove effects before applying them so invalid state always wins this tick.
execute as @a[tag=de_ag_effects,tag=!de_ag_inside] at @s run function zbk_der_eisendrache:anti_gravity/movement/remove
execute as @a[tag=de_ag_effects,tag=de_ag_suppressed] at @s run function zbk_der_eisendrache:anti_gravity/movement/remove
execute unless score #room de_ag_state matches 1 as @a[tag=de_ag_effects] at @s run function zbk_der_eisendrache:anti_gravity/movement/remove

# Eligible players receive the modifier once until their state changes.
execute if score #room de_ag_state matches 1 as @a[tag=de_ag_inside,tag=!de_ag_suppressed,tag=!de_ag_effects] at @s run function zbk_der_eisendrache:anti_gravity/movement/apply
