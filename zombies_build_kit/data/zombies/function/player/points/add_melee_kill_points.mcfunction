execute if items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run advancement revoke @s only zombies:kill_game_enemy
execute if items entity @s weapon.mainhand *[custom_data~{mob_immunity_tool:true}] run return 0

# Add Points (no points if downed)
execute if entity @s[team=!downed] if score global double_points matches 0 run scoreboard players add @s player_points 130
execute if entity @s[team=!downed] if score global double_points matches 1 run scoreboard players add @s player_points 260

# Track kill stat
scoreboard players add @s stat_kills 1

# Decrement powerup drop gate (only if above 0)
function zbk:dispatch/voice_event_kill
execute if score #global drop_req_kills matches 1.. run scoreboard players remove #global drop_req_kills 1
execute if score #global drop_req_kills matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[DROP] ","color":"aqua"},{"text":"Req kills: ","color":"green"},{"score":{"name":"#global","objective":"drop_req_kills"},"color":"yellow"}]

# Reset Advancement
advancement revoke @s only zombies:kill_game_enemy
