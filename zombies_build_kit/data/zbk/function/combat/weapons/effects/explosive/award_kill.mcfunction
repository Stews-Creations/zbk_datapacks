# Run as the original shooter. Downed players retain statistics but earn no points.
execute if entity @s[team=!downed] run scoreboard players operation @s player_points += #blast_award stats
scoreboard players add @s stat_kills 1
execute if score #global drop_req_kills matches 1.. run scoreboard players remove #global drop_req_kills 1
advancement revoke @s only zbk:kill_game_enemy
