# Only release a team assignment this effect owns; preserve external changes.
execute if entity @s[tag=cherry_blue_owned,team=cherry_stun] run team leave @s
tag @s remove cherry_blue_owned
tag @s remove cherry_stunned
scoreboard players reset @s cherry_stun
