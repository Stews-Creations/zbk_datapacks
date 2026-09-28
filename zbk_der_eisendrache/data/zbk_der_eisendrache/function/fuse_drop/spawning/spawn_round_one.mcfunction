# Scheduled after the Round 1 start function has finished initializing the round.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #global game_active matches 1.. run return 0
execute unless score #global wave.round matches 1 run return 0
execute unless score #global wave.is_active matches 1 run return 0
execute unless score #global de_fuse matches 0 run return 0
execute at @e[type=minecraft:marker,tag=de_fuse_drop_marker,limit=1] run function zbk_der_eisendrache:combat/powerups/fuse/spawn
