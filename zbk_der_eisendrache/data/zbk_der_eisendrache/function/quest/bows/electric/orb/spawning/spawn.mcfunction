# Impact position and #player stats identify this shot's center and owner.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #player stats matches 1.. run return 0
execute summon minecraft:marker run function zbk_der_eisendrache:quest/bows/electric/orb/spawning/configure
playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.ball_explo master @a[distance=..15] ~ ~ ~ 1 1
