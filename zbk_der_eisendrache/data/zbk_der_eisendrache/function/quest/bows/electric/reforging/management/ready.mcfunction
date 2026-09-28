execute unless score #active zbk.de matches 1 run return 0
scoreboard players set #sequence de_er_state 2
scoreboard players set @s de_er_state 2
tag @e[type=item_display,tag=de_el_vane_head] remove de_el_vane_spinning
kill @e[tag=de_er_runtime]
function zbk_der_eisendrache:quest/bows/electric/reforging/display/sync
particle minecraft:flash{color:[0.2,0.6,1.0,1.0]} ~ ~0.6 ~ 0 0 0 0 1 force @a[distance=..48]
playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.tornado_arrow master @a[distance=..15] ~ ~ ~ 1 1
