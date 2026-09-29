# Preserve fractional health for explosive impacts and the later crawler gate.
# Position is the raycast hit; retain the existing direct headshot bonus.
scoreboard players operation #direct_explosive_damage stats = #damage stats
scoreboard players set #direct_explosive_scale stats 100
scoreboard players operation #direct_explosive_damage stats *= #direct_explosive_scale stats
scoreboard players operation #direct_explosive_remaining stats = #direct_explosive_before stats
scoreboard players operation #direct_explosive_remaining stats -= #direct_explosive_damage stats
execute if entity @s[distance=1.65..] run scoreboard players operation #direct_explosive_remaining stats -= #direct_explosive_damage stats
execute if score global insta_kill matches 1 run scoreboard players set #direct_explosive_remaining stats 0
execute if score #direct_explosive_remaining stats matches ..0 run scoreboard players set #direct_explosive_remaining stats 0
execute store result entity @s Health float 0.01 run scoreboard players get #direct_explosive_remaining stats
