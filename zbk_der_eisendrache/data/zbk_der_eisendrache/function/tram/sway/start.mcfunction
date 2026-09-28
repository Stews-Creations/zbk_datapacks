# Start a short, damped suspension sway after arriving at Middle.
scoreboard players set @s tram_sway_timer 16
tag @s add tram_swaying
schedule function zbk_der_eisendrache:tram/sway/loop 1t replace
