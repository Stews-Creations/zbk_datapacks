# Runs as one active reward marker at its location.
scoreboard players operation #tram_reward_id global = @s tram_link_id
scoreboard players set #tram_reward_found global 0
execute as @e[type=interaction,tag=tram_reward_interaction] if score @s tram_link_id = #tram_reward_id global run scoreboard players set #tram_reward_found global 1
execute as @e[type=item_display,tag=tram_reward_pickup] if score @s tram_link_id = #tram_reward_id global run scoreboard players set #tram_reward_found global 1

# All reward types use the standard 600-tick (30 second) drop lifetime.
execute if score @s tram_r_state matches 1 if score @s tram_r_timer matches 1.. run scoreboard players remove @s tram_r_timer 1
execute if score @s tram_r_state matches 1 if score @s tram_r_timer matches ..0 run scoreboard players set @s tram_r_state 2
execute if score @s tram_r_state matches 1 if score #tram_reward_found global matches 0 run scoreboard players set @s tram_r_state 2

# Claimed, picked up, or timed-out rewards wait until the matching tram is clear.
# The box follows the tram root and covers its 9x5 footprint plus a one-block margin.
execute if score @s tram_r_state matches 2 run function zbk_der_eisendrache:tram/reward/cleanup_linked
scoreboard players set #tram_area_occupied global 0
execute if score @s tram_r_state matches 2 as @e[type=block_display,tag=tram_route_display] if score @s tram_link_id = #tram_reward_id global at @s positioned ~-1 ~-2 ~-1 if entity @a[dx=10,dy=6,dz=6] run scoreboard players set #tram_area_occupied global 1
execute if score @s tram_r_state matches 2 as @e[type=block_display,tag=tram_route_display] if score @s tram_link_id = #tram_reward_id global at @s positioned ~-1 ~-2 ~-1 if entity @e[type=minecraft:zombified_piglin,tag=!turned_zombie,dx=10,dy=6,dz=6] run scoreboard players set #tram_area_occupied global 1
execute if score @s tram_r_state matches 2 as @e[type=block_display,tag=tram_route_display] if score @s tram_link_id = #tram_reward_id global at @s positioned ~-1 ~-2 ~-1 if entity @e[type=minecraft:wolf,dx=10,dy=6,dz=6] run scoreboard players set #tram_area_occupied global 1
execute if score @s tram_r_state matches 2 as @e[type=block_display,tag=tram_route_display] if score @s tram_link_id = #tram_reward_id global at @s positioned ~-1 ~-2 ~-1 if entity @e[type=minecraft:iron_golem,tag=panzer_ai,tag=!panzer_dying,dx=10,dy=6,dz=6] run scoreboard players set #tram_area_occupied global 1
execute if score @s tram_r_state matches 2 if score #tram_area_occupied global matches 0 run function zbk_der_eisendrache:tram/reward/auto_return
