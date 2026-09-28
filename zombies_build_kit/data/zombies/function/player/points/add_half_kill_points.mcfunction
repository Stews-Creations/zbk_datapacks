# Half-credit kill (used by element AoE kills — element AoE is cheap mass-clear)
execute if entity @s[team=!downed] if score global double_points matches 0 run scoreboard players add @s player_points 50
execute if entity @s[team=!downed] if score global double_points matches 1 run scoreboard players add @s player_points 100

# Track kill stat
scoreboard players add @s stat_kills 1

# Decrement powerup drop gate (only if above 0)
execute if score #global drop_req_kills matches 1.. run scoreboard players remove #global drop_req_kills 1

# Reset Advancement
advancement revoke @s only zombies:kill_game_enemy
