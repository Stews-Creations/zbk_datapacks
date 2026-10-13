# Cherry colors ordinary unteamed zombies; preserve custom map teams.
execute if entity @s[tag=immune_elements] run return 0
function zbk:combat/weapons/pack_a_punch/elements/dead_wire/stun
execute if entity @s[team=] run tag @s add cherry_blue_owned
execute if entity @s[team=,tag=cherry_blue_owned] run team join cherry_stun @s
tag @s add cherry_stunned
scoreboard players set @s cherry_stun 60
