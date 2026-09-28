# Der Eisendrache Pack-a-Punch model tick.

function zbk_der_eisendrache:map_pack_a_punch/machine/animation/spin_rotaters
function zbk_der_eisendrache:map_pack_a_punch/machine/animation/glow_effect

execute as @e[type=marker,tag=de_pack_a_punch_location,tag=pap_anim_active] if score @s pap_anim matches 1..120 at @s run function zbk_der_eisendrache:map_pack_a_punch/machine/animation/blue_flashes
