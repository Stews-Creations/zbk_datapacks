# Relocate launch-zone zombies once, on the first player-damage pulse.
scoreboard players set #rocket_test_launch rkt_hazard_moved 1
execute unless score #global game_active matches 1 run return 0

execute as @e[type=minecraft:zombified_piglin,tag=wave_enemy,x=37,y=78,z=42,dx=45,dy=30,dz=45] at @s run function zbk:behavior/relocation/refunds/refund_zombie
