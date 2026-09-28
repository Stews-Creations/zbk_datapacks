# Scheduled callbacks recheck ownership before moving entities or playing sound.
execute unless score #active zbk.de matches 1 run return 0

# Two side-to-side passes; the second uses half the travel for a damped finish.
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=15..16}] at @s run tp @s ~0.03 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=13..14}] at @s run tp @s ~-0.03 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=11..12}] at @s run tp @s ~-0.03 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=9..10}] at @s run tp @s ~0.03 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=7..8}] at @s run tp @s ~0.015 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=5..6}] at @s run tp @s ~-0.015 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=3..4}] at @s run tp @s ~-0.015 ~ ~
execute as @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=1..2}] at @s run tp @s ~0.015 ~ ~

scoreboard players remove @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=1..}] tram_sway_timer 1
tag @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=0}] remove tram_swaying
execute if entity @e[type=block_display,tag=tram_route_display,tag=tram_swaying,scores={tram_sway_timer=1..}] run schedule function zbk_der_eisendrache:tram/sway/loop 1t replace
