# Give Points (no points if downed)
execute if entity @s[team=!downed] if score global double_points matches 0 run scoreboard players add @s player_points 10
execute if entity @s[team=!downed] if score global double_points matches 1 run scoreboard players add @s player_points 20
