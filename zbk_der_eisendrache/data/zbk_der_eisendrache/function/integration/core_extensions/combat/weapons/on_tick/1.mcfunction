scoreboard players remove @a[scores={bow_trigger_lock=1..}] bow_trigger_lock 1
execute as @a[scores={bow_charging=1}] run function zbk_der_eisendrache:combat/weapons/guns/bow/fire
scoreboard players remove @a[scores={bow_charging=1..}] bow_charging 1
execute as @a[scores={electric_draw=1..}] run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/validate_draw_sound
