# Context: reforging marker with position and rotation preserved.
# Reconstruct presentation before emitting waiting effects; interactions remain in the following global pass.

function zbk_der_eisendrache:quest/bows/electric/reforging/display/sync
execute if score @s de_er_state matches 0 if entity @a[distance=..48] run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/waiting
