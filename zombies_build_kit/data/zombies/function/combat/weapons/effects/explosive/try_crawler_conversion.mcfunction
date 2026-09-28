# Post-damage gate only. #blast_before and #blast_applied are hundredths of health.
# Called at the surviving victim's feet; never applies another hit or awards points.
execute unless entity @s[type=zombified_piglin,nbt={IsBaby:0b}] run return 0
execute if entity @s[tag=combat_ignore] run return 0
execute if entity @s[tag=turned_zombie] run return 0
execute if entity @s[tag=immune_explosives] run return 0
execute if entity @s[tag=monkey_bomb_decoy] run return 0
execute if entity @s[tag=solo_down_decoy] run return 0
execute if score global insta_kill matches 1 run return 0
execute store result score #crawler_remaining stats run data get entity @s Health 100
execute if score #crawler_remaining stats matches ..0 run return 0
execute unless score #blast_before stats matches 1.. run return 0
# At least 10% of pre-hit health must have been removed by this hit.
scoreboard players operation #crawler_threshold stats = #blast_before stats
scoreboard players add #crawler_threshold stats 9
scoreboard players set #crawler_divisor stats 10
scoreboard players operation #crawler_threshold stats /= #crawler_divisor stats
execute if score #blast_applied stats < #crawler_threshold stats run return 0
# Ray Gun eligibility is weapon-owned; other explosives retain their existing gate.
execute if score #blast_raygun stats matches 1 store result score #raygun_crawler_allowed stats run function zombies:combat/weapons/guns/ray_gun/validation/crawler_chance
execute if score #blast_raygun stats matches 1 unless score #raygun_crawler_allowed stats matches 1 run return 0
return run function zombies:combat/weapons/effects/convert_to_baby
