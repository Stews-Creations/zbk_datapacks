# Called as/at one debris item_display during the link animation.

scoreboard players add @s map_pap_uses 1
execute if score @s map_pap_uses matches ..75 run tp @s ~ ~0.016 ~
execute if score @s map_pap_uses matches ..75 run particle minecraft:dust{color:[0.15,0.55,1.0],scale:0.7} ~ ~ ~ 0.20 0.20 0.20 0 4 force
execute if score @s map_pap_uses matches ..75 run particle minecraft:electric_spark ~ ~ ~ 0.14 0.14 0.14 0.02 2 force
execute if score @s map_pap_uses matches ..75 run particle minecraft:end_rod ~ ~ ~ 0.10 0.10 0.10 0.01 1 force
execute if score @s map_pap_uses matches 76.. run function zbk_der_eisendrache:map_pack_a_punch/unlock/debris_finish_display
