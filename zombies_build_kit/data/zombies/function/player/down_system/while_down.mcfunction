# Make them stay down (mount own downed body matched by player id)
scoreboard players operation #downed_id id = @s id
execute as @e[type=armor_stand,tag=downed_body,distance=..10] if score @s id = #downed_id id run tag @s add my_body
ride @s mount @e[type=armor_stand,tag=my_body,limit=1]
tag @e[tag=my_body] remove my_body

# Decrement the timer
scoreboard players remove @s downed_timer 1

# Get remaining seconds
scoreboard players operation @s downed_timer_seconds = @s downed_timer
scoreboard players operation @s downed_timer_seconds /= #tick downed_timer

# Display title/actionbar
title @s actionbar [{"text":"Downed: ","color":"red"},{"score":{"name":"@s","objective":"downed_timer_seconds"},"color":"yellow"}]

# If timer reaches 0, call on_death
execute if score @s downed_timer matches 0 run execute as @s run function zombies:player/down_system/on_death

# Radius circle
function zombies:player/down_system/particles

# Keep solo revive decoys from showing daylight fire visuals
execute as @e[type=zombie,tag=solo_down_decoy] run data modify entity @s Fire set value 0s

# Solo mode with Quick Revive: Auto self-revive
execute if score #game_mode game_mode matches 1 if score @s perk_revive matches 1.. run function zombies:player/down_system/start_solo_revive

# Co-op mode: Normal revive logic (requires teammate nearby)
execute if score #game_mode game_mode matches 2 if entity @p[team=!downed,distance=..4, gamemode=adventure] run function zombies:player/down_system/start_revive
execute if score #game_mode game_mode matches 2 unless entity @p[team=!downed,distance=..4, gamemode=adventure] run function zombies:player/down_system/reset_revive
