# Timer 31..2 yields 70.8..1.2 degrees per tick, decreasing by 2.4 each tick.
# The 30 steps total 1080 degrees (three full turns).
scoreboard players operation #de_el_spin temp = @s de_el_timer
scoreboard players set #de_el_spin_scale temp 24
scoreboard players operation #de_el_spin temp *= #de_el_spin_scale temp
scoreboard players remove #de_el_spin temp 36
execute store result storage zbk:temp electric_vane_spin.yaw double 0.1 run scoreboard players get #de_el_spin temp
function zbk_der_eisendrache:quest/bows/electric/weather_vane/animations/rotate with storage zbk:temp electric_vane_spin
