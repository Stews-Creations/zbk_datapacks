# Reconstruct missing runtime before synchronizing charge on every matching effect marker.
# Do not cache presence across ticks: chunk loading and marker edits can invalidate it.

# Rebuild stale geometry/identity as well as missing interactions, including after chunk loading.
$execute positioned ~ ~-4.25 ~ unless entity @e[type=interaction,tag=de_el_fire_$(id)_runtime,tag=de_el_fire_target,distance=..0.001,nbt={width:5.5f,height:5f},scores={de_el_fire_id=$(id)}] positioned ~ ~4.25 ~ run function zbk_der_eisendrache:quest/bows/electric/fires/spawning/runtime with entity @s data
$execute unless entity @e[type=marker,tag=de_el_fire_fx,tag=de_el_fire_$(id)_runtime] run function zbk_der_eisendrache:quest/bows/electric/fires/spawning/runtime with entity @s data
$execute as @e[type=marker,tag=de_el_fire_fx,tag=de_el_fire_$(id)_runtime] run function zbk_der_eisendrache:quest/bows/electric/fires/display/set_charge {id:$(id)}

$execute if score #$(id) de_el_fire_lit matches 1 if entity @a[distance=..256] as @e[type=marker,tag=de_el_fire_fx,tag=de_el_fire_$(id)_runtime,limit=1] at @s run function zbk_der_eisendrache:quest/bows/electric/fires/effects/tick
