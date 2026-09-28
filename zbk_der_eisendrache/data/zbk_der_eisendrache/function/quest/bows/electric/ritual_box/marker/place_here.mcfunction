function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/clear_runtime
kill @e[type=marker,tag=de_eb_marker]
summon marker ~ ~ ~ {Tags:["de_eb_marker"]}
tp @e[type=marker,tag=de_eb_marker,limit=1] ~ ~ ~ ~ 0
scoreboard players set #registered de_eb_state 1
scoreboard players add #phase de_eb_state 0
scoreboard players add #souls de_eb_souls 0
execute as @e[type=marker,tag=de_eb_marker,limit=1] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/display/sync
tellraw @s {"text":"Electric ritual interaction marker placed. Collect the reforged arrow before using it.","color":"aqua"}
