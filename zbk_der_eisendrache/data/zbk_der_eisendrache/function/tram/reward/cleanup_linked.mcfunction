# Runs as a reward marker and removes only entities with its Link ID.
scoreboard players operation #tram_reward_id global = @s tram_link_id
execute as @e[tag=tram_reward_interaction] if score @s tram_link_id = #tram_reward_id global run kill @s
execute as @e[tag=tram_reward_ui] if score @s tram_link_id = #tram_reward_id global run kill @s
execute as @e[type=item_display,tag=tram_reward_pickup] if score @s tram_link_id = #tram_reward_id global run kill @s
