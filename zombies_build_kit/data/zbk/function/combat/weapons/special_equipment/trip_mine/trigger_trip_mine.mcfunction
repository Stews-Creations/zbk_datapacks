# ===================================
# TRIGGER TRIP MINE
# ===================================
# Called as the armed trip mine marker.

tag @s add trip_mine_launching
scoreboard players set @s timer 10

playsound minecraft:block.lever.click hostile @a[distance=..16] ~ ~ ~ 1 1.8
playsound minecraft:entity.firework_rocket.launch hostile @a[distance=..16] ~ ~ ~ 0.65 1.5
particle minecraft:smoke ~ ~0.25 ~ 0.2 0.1 0.2 0.03 8 force
