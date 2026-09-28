# Eight-second ascent (160 ticks) plus a two-second hold. Pause while the vane is unloaded.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=item_display,tag=de_el_vane_head] run return 0
scoreboard players add #time de_er_tick 1
execute if score #time de_er_tick matches ..160 run data modify entity @e[type=item_display,tag=de_er_arrow,limit=1] start_interpolation set value 0
execute if score #time de_er_tick matches ..160 store result entity @e[type=item_display,tag=de_er_arrow,limit=1] transformation.translation[1] float 0.05 run scoreboard players get #time de_er_tick
execute if score #time de_er_tick matches 200.. run function zbk_der_eisendrache:quest/bows/electric/reforging/management/ready
