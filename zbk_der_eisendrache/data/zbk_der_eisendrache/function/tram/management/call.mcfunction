# The two physical routes are mirrored:
# calling Tram 1 sends both roots toward Start, while calling Tram 2 sends both toward End.
# Usage: /function zbk_der_eisendrache:tram/management/call {id:1}
#        /function zbk_der_eisendrache:tram/management/call {id:2}
execute unless score #active zbk.de matches 1 run return 0
$scoreboard players set #tram_called_id global $(id)
execute unless score #tram_called_id global matches 1..2 run tellraw @s [{"text":"[Tram] ","color":"gold"},{"text":"Call ID must be 1 or 2.","color":"red"}]
execute unless score #tram_called_id global matches 1..2 run return fail

# A new call replaces any previous reward lifecycle.
function zbk_der_eisendrache:tram/reward/reset
scoreboard players set #tram_arriving_sound global 0
scoreboard players set #tram_departing_sound global 1

# Remember the player who made this call so player-specific rewards can be validated on arrival.
scoreboard players set #tram_reward_owner global 0
execute if entity @s[type=minecraft:player] run scoreboard players operation #tram_reward_owner global = @s id

# Select the mirrored pair of destinations.
execute if score #tram_called_id global matches 1 run scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_destination 1
execute if score #tram_called_id global matches 2 run scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_destination 3

# Only the explicitly called tram awards its linked reward when it arrives.
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_reward 0
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_reward_own 0
execute as @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] if score @s tram_link_id = #tram_called_id global run scoreboard players set @s tram_reward 1
execute as @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] if score @s tram_link_id = #tram_called_id global run scoreboard players operation @s tram_reward_own = #tram_reward_owner global

# Close linked platform doors, then move after their 10-tick animation.
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_sway_timer 0
tag @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] remove tram_swaying
execute as @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] at @s run function zbk_der_eisendrache:tram/doors/animations/close_linked
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_timer 200
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_delay_timer 10
execute if entity @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2,tram_delay_timer=0..}] run schedule function zbk_der_eisendrache:tram/route/move_loop 1t replace
