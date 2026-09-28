# Fresh snapshot for one synchronous batch; callbacks may not mutate centers.
scoreboard players set #storm_lookup_active temp 0
data modify storage zbk:temp storm_lookup_index set value {seen:{},live:{}}
execute as @e[type=marker,tag=de_electric_storm,scores={de_storm_link=1..}] run function zbk_der_eisendrache:quest/bows/electric/storm/lookup/record
scoreboard players set #storm_lookup_active temp 1
