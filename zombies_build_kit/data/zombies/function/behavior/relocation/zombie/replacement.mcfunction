execute if score #replacement zr_state matches 1 run return 0
$execute as @e[type=marker,tag=zombie_spawner,scores={spawner_unlocked=1},distance=..$(range)] at @s run function zombies:behavior/relocation/zombie/replacement_marker
