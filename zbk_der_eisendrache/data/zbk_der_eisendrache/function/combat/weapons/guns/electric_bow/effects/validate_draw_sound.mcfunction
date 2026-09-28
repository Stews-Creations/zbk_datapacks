# Catch non-release cancellation paths, invalid slots, death and downed state.
execute store result score #electric_draw_valid temp run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/draw_sound_eligible
execute unless score #electric_draw_valid temp matches 1 run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/stop_draw_sound
