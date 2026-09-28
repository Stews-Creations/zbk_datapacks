# Validate lifetime and quest stage before resolving a fresh linked target.
# The facing context belongs only to this synchronous movement call; missing targets retire the orb.

scoreboard players add @s de_es_age 1
execute if score @s de_es_age matches 100.. run return run kill @s
execute unless score #electric de_el_progress matches 2.. run return run kill @s
$execute facing entity @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}},limit=1] feet run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/animations/advance_orb with entity @s data
kill @s
