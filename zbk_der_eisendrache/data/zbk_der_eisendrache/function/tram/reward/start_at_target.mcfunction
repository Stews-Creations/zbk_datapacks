# Context: chosen reward location at its position, with owner and #tram_reward_id already supplied.
# Replace only the linked reward before opening its 600-tick (30-second) window.

function zbk_der_eisendrache:tram/reward/cleanup_linked
execute if score #tram_reward_id global matches 1 run function zbk_der_eisendrache:tram/reward/claim/spawn
execute if score #tram_reward_id global matches 2 run function zbk_der_eisendrache:tram/reward/powerup/spawn_random
scoreboard players set @s tram_r_state 1
scoreboard players set @s tram_r_timer 600
