execute unless entity @s[tag=rs_melee_managed] run return 0
attribute @s minecraft:attack_damage modifier remove zombies:shield_melee_router
tag @s remove rs_melee_managed
scoreboard players reset @s rs_native_damage
scoreboard players reset @s rs_attack_cd
