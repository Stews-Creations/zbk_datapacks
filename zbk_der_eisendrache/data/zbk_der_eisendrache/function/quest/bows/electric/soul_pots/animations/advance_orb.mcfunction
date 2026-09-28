# Context: orb facing its linked pot; id is the orb link configuration.
# Retain the nearby-arrival check before movement, then emit particles at the updated position.

$execute if entity @e[type=marker,tag=de_es_pot,nbt={data:{id:$(id)}},distance=..0.4] run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/arrive
tp @s ^ ^ ^0.3
execute at @s run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/orb
