# Target executor; ray position is retained for head height and shooter distance.
# Hundredths of a health point keep low-damage pellets meaningful.
scoreboard players operation #hit_damage stats = #damage stats
scoreboard players operation #hit_damage stats *= #100 stats
scoreboard players set #shot_distance stats 0
execute as @a if score @s id = #player stats run scoreboard players operation #shot_distance stats = @s raycast_distance
execute if score #shot_distance stats > #bo3_start stats run function zombies:combat/weapons/guns/bo3/combat/falloff
execute if entity @s[distance=1.65..] run scoreboard players operation #hit_damage stats *= #bo3_head stats
execute if entity @s[distance=1.65..] run scoreboard players operation #hit_damage stats /= #100 stats
scoreboard players operation #hit_damage stats /= #bo3_pellets stats
execute store result score #health stats run data get entity @s Health 100
scoreboard players operation #health stats -= #hit_damage stats
execute if score global insta_kill matches 1 run scoreboard players set #health stats 0
execute store result entity @s Health float 0.01 run scoreboard players get #health stats
execute if score #bo3_pellets stats matches 2.. run tag @s add bo3_shell_hit
