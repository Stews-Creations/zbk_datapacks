# @s = Help text display

execute if entity @s[tag=being_looked_at,tag=!hovered] at @s run playsound minecraft:block.note_block.hat master @a[distance=..10] ~ ~ ~ 0.5 2
execute if entity @s[tag=being_looked_at] run data modify entity @s text set value [{"text":"> Help <","color":"yellow"}]
execute unless entity @s[tag=being_looked_at] run data modify entity @s text set value [{"text":"Help","color":"gray"}]
execute if entity @s[tag=being_looked_at] run tag @s add hovered
execute unless entity @s[tag=being_looked_at] run tag @s remove hovered
