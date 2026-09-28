# Snap the tram root to the exact center of its linked destination marker.
function zbk_der_eisendrache:tram/route/audio/stop
execute at @e[type=marker,tag=tram_route_target,limit=1] run tp @s ~ ~ ~
scoreboard players set @s tram_timer 200
# Only the explicitly called tram opens its assigned platform doors.
# Middle is the waiting position and must always remain closed.
execute if score @s tram_reward matches 1 if score @s tram_destination matches 1 run function zbk_der_eisendrache:tram/doors/animations/open_linked
execute if score @s tram_reward matches 1 if score @s tram_destination matches 3 run function zbk_der_eisendrache:tram/doors/animations/open_linked
execute if score @s tram_destination matches 2 run function zbk_der_eisendrache:tram/sway/start
execute if score @s tram_reward matches 1 run function zbk_der_eisendrache:tram/reward/on_arrive
