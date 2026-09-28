# Add Points (no points if downed)
execute if entity @s[team=!downed] if score global double_points matches 0 run scoreboard players add @s player_points 100
execute if entity @s[team=!downed] if score global double_points matches 1 run scoreboard players add @s player_points 200

# Track kill stat
scoreboard players add @s stat_kills 1

# Decrement powerup drop gate (only if above 0)
execute if score #global drop_req_kills matches 1.. run scoreboard players remove #global drop_req_kills 1

# Reset Advancement
advancement revoke @s only zombies:kill_game_enemy
