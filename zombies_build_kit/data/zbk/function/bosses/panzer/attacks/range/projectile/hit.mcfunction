# Applies the Panzer electric projectile hit.
# Runs as and at: hit player.

execute unless entity @s[gamemode=adventure,team=!downed] run return 0
scoreboard players set #panzer_electric_hit temp 1
damage @s 2 minecraft:generic
effect give @s minecraft:slowness 4 1 true
particle minecraft:electric_spark ~ ~1 ~ 0.35 0.55 0.35 0.45 28 force
particle minecraft:dust{color:[0.25,0.9,1.0],scale:1.0} ~ ~1 ~ 0.18 0.35 0.18 0 14 force
playsound minecraft:entity.player.hurt player @s ~ ~ ~ 0.8 1.2
playsound minecraft:block.conduit.attack.target player @s ~ ~ ~ 0.9 1.6
