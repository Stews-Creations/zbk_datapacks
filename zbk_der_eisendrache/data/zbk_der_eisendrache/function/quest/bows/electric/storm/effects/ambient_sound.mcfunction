# As one listener at their feet; nearest live source prevents stacked identical loops.
execute unless score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/storm/effects/stop_ambient_sound
execute unless entity @e[type=marker,tag=de_electric_storm,scores={de_storm_life=1..},distance=..10,sort=nearest,limit=1] run return run function zbk_der_eisendrache:quest/bows/electric/storm/effects/stop_ambient_sound
scoreboard players add @s de_storm_audio 0
execute if score @s de_storm_audio matches 1.. run scoreboard players remove @s de_storm_audio 1
execute if score @s de_storm_audio matches 1.. run return 0
execute at @e[type=marker,tag=de_electric_storm,scores={de_storm_life=1..},distance=..10,sort=nearest,limit=1] run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_tornado master @s ~ ~ ~ 0.5 1
# 4.522667-second source; repeat every 91 ticks (4.55 seconds).
scoreboard players set @s de_storm_audio 91
