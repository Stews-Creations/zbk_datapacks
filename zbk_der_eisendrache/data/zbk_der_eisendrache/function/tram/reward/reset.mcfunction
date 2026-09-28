# Clear all active and pending tram rewards.
scoreboard players set @e[type=marker,tag=tram_reward_spawn] tram_r_state 0
scoreboard players set @e[type=marker,tag=tram_reward_spawn] tram_r_timer 0
scoreboard players set @e[type=marker,tag=tram_reward_spawn] tram_reward_own 0
scoreboard players set @e[type=block_display,tag=tram_route_display] tram_reward_own 0
kill @e[tag=tram_reward_interaction]
kill @e[tag=tram_reward_ui]
kill @e[type=item_display,tag=tram_reward_pickup]
