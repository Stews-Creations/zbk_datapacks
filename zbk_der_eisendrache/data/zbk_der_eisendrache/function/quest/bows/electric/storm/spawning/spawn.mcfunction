# Transient Der Eisendrache storm. Caller supplies the shooter's stable ID in #player stats.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #player stats matches 1.. run return 0
execute summon minecraft:marker run function zbk_der_eisendrache:quest/bows/electric/storm/spawning/configure
particle minecraft:flash{color:[0.6,0.8,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force
playsound minecraft:item.trident.thunder master @a[distance=..32] ~ ~ ~ 0.6 1.3
playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.ball_explo master @a[distance=..15] ~ ~ ~ 1 1
