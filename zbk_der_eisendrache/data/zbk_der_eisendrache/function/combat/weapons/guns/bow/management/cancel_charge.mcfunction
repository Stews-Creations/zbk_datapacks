# Cancel any bow's pending release and its loop sound.
scoreboard players set @s bow_charging 0
scoreboard players set @s bow_charge_time 0
scoreboard players set @s bow_is_charged 0
scoreboard players reset @s bow_trigger_lock
scoreboard players reset @s electric_bow_trigger_lock
stopsound @s master zbk_der_eisendrache:base_bow.bowlauncher_loop_stretch
function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/stop_draw_sound
function zbk_der_eisendrache:events/bow_cancel
