# Context: start marker at its position after the global activation pass.
# Decrement, attempt the zero-timer launch, then clear the timer even if the route is missing.

execute if score @s 115_launch_timer matches 1.. run scoreboard players remove @s 115_launch_timer 1
execute if score @s 115_launch_timer matches 0 if entity @e[type=marker,tag=115_launch_peak,limit=1] if entity @e[type=marker,tag=115_launch_end,limit=1] run function zbk_der_eisendrache:115_launch/management/launch
execute if score @s 115_launch_timer matches 0 run scoreboard players reset @s 115_launch_timer
