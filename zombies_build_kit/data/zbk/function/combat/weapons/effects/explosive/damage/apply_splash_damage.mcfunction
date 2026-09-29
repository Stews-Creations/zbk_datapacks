# One blast victim at its feet. Damage first, then death or optional crawler conversion.
# Requires #shooter_id, #explosive_damage (whole health), #blast_crawlers (0/1),
# and #blast_kill_bonus (base kill points after the 10-point hit), all in stats.
execute if entity @s[tag=combat_ignore] run return 0
execute if entity @s[tag=immune_explosives] run return 0
execute if entity @s[tag=monkey_bomb_decoy] run return 0
execute if entity @s[tag=solo_down_decoy] run return 0
execute if entity @s[tag=turned_zombie] run return 0
execute store result score #blast_before stats run data get entity @s Health 100
execute if score #blast_before stats matches ..0 run return 0
execute unless score #explosive_damage stats matches 1.. run return 0

scoreboard players operation #blast_applied stats = #explosive_damage stats
scoreboard players set #blast_scale stats 100
scoreboard players operation #blast_applied stats *= #blast_scale stats
scoreboard players operation #blast_remaining stats = #blast_before stats
scoreboard players operation #blast_remaining stats -= #blast_applied stats
execute if score global insta_kill matches 1 run scoreboard players set #blast_remaining stats 0
execute if score #blast_remaining stats matches ..0 run scoreboard players set #blast_remaining stats 0
execute store result entity @s Health float 0.01 run scoreboard players get #blast_remaining stats
particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~1 ~ 0.5 0.5 0.5 2 30
execute as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10
execute if score global double_points matches 1 as @a[team=!downed] if score @s id = #shooter_id stats run scoreboard players add @s player_points 10

execute if score #blast_remaining stats matches 0 run return run function zbk:combat/weapons/effects/explosive/kills/kill
execute if score #blast_crawlers stats matches 1 run function zbk:combat/weapons/effects/explosive/kills/try_crawler_conversion
