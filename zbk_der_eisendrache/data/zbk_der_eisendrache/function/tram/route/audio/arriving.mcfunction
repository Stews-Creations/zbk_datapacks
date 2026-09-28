# The route dispatcher has selected the first eligible arrival.
# Broadcast and set the shared latch together so another tram cannot repeat the announcement.

execute as @a at @s run playsound zbk_der_eisendrache:tram.vox_cast_maxis_gondola_pa_arriving master @s ~ ~ ~ 1 1
scoreboard players set #tram_arriving_sound global 1
