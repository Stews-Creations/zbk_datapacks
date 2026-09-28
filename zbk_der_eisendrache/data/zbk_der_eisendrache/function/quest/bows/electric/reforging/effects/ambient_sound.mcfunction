# As one listener at their feet; nearest live source prevents stacked identical loops.
execute unless score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/stop_ambient_sound
execute unless score #electric de_el_progress matches 3 run return run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/stop_ambient_sound
execute unless score #sequence de_er_state matches 0..1 run return run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/stop_ambient_sound
execute unless entity @e[type=item_display,tag=de_el_vane_head,distance=..32,sort=nearest,limit=1] run return run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/stop_ambient_sound
scoreboard players add @s de_vane_audio 0
execute if score @s de_vane_audio matches 1.. run scoreboard players remove @s de_vane_audio 1
execute if score @s de_vane_audio matches 1.. run return 0
execute at @e[type=item_display,tag=de_el_vane_head,distance=..32,sort=nearest,limit=1] run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_tornado_vane master @s ~ ~ ~ 0.25 1 0.5
# 4.522667-second source; repeat every 91 ticks (4.55 seconds).
scoreboard players set @s de_vane_audio 91
