# Continuous X-axis spin animation for the Der Eisendrache Pack-a-Punch rotaters item_display.

execute unless entity @e[type=item_display,tag=de_pack_a_punch_rotaters,limit=1] run return 0

scoreboard players add #de_pack_a_punch_spin_tick pack_a_punch 1
execute if score #de_pack_a_punch_spin_tick pack_a_punch matches 3.. run function zbk_der_eisendrache:map_pack_a_punch/machine/animation/spin_advance
