# Select the linked reward location and copy ownership before entering its local spawn helper.
# Clear the temporary target tag after the helper returns so the next tram resolves independently.

# Runs as the called tram root once it reaches its destination.
scoreboard players set @s tram_reward 0
execute unless score #active zbk.de matches 1 run return 0
scoreboard players operation #tram_reward_id global = @s tram_link_id
tag @e[type=marker,tag=tram_reward_target] remove tram_reward_target
execute as @e[type=marker,tag=tram_reward_spawn] if score @s tram_link_id = #tram_reward_id global run tag @s add tram_reward_target
execute unless entity @e[type=marker,tag=tram_reward_target,limit=1] run return 0
scoreboard players operation @e[type=marker,tag=tram_reward_target,limit=1] tram_reward_own = @s tram_reward_own

# Replace any unclaimed reward belonging to this same linked location.
execute as @e[type=marker,tag=tram_reward_target,limit=1] at @s run function zbk_der_eisendrache:tram/reward/start_at_target

tag @e[type=marker,tag=tram_reward_target] remove tram_reward_target
