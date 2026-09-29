# Never reset the counter: unloaded markers retain their IDs.
scoreboard players add #next pm_v2_id 1
scoreboard players operation @s pm_v2_id = #next pm_v2_id
