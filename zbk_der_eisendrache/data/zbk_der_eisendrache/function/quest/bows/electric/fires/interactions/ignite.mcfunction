$execute if score #$(id) de_el_fire_lit matches 1 run return 0
$execute unless score #$(id) de_el_fire_set matches 1 run return 0
$scoreboard players set #$(id) de_el_fire_lit 1
$execute at @e[type=interaction,tag=de_el_fire_$(id)_runtime,limit=1] run particle minecraft:flame ~ ~0.6 ~ 0.4 0.3 0.4 0.05 30 force
scoreboard players set #de_el_lit_count temp 0
execute if score #1 de_el_fire_lit matches 1 run scoreboard players add #de_el_lit_count temp 1
execute if score #2 de_el_fire_lit matches 1 run scoreboard players add #de_el_lit_count temp 1
execute if score #3 de_el_fire_lit matches 1 run scoreboard players add #de_el_lit_count temp 1
tellraw @s[tag=debug] [{"text":"Electric quest: ","color":"aqua"},{"score":{"name":"#de_el_lit_count","objective":"temp"}},{"text":"/3 fires lit."}]
execute if score #de_el_lit_count temp matches 3 run scoreboard players set #electric de_el_progress 1
execute if score #de_el_lit_count temp matches 3 run tellraw @s[tag=debug] {"text":"All three fires lit. First quest segment complete!","color":"aqua"}
# Consume accepted shots so the original bow does not explode behind the target.
scoreboard players set @s raycast_distance 10001
return 1
