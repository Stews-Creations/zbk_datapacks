# Context: listener at their position; caller has confirmed a loaded exhaust anchor.
# Any exhaust within 100 blocks selects full volume; return prevents also playing the distant version.

execute if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,distance=..100,limit=1] run return run playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.vox_cast_maxis_rocket_pa_complete master @s ~ ~ ~ 1 1
playsound zbk_der_eisendrache:der_eisendrache.rocket_test_launch.vox_cast_maxis_rocket_pa_complete master @s ~ ~ ~ 0.05 1
