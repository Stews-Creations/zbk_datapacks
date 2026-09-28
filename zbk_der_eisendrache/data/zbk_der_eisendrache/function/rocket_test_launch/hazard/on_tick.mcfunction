# The launch-pad kill zone is active only during the 400-tick rocket burn.
execute unless score #rocket_test_launch rkt_test_state matches 4 run scoreboard players set #rocket_test_launch rkt_hazard_timer 0
execute unless score #rocket_test_launch rkt_test_state matches 4 run scoreboard players set #rocket_test_launch rkt_hazard_moved 0
execute unless score #rocket_test_launch rkt_test_state matches 4 run return 0

scoreboard players add #rocket_test_launch rkt_hazard_timer 1
execute if score #rocket_test_launch rkt_hazard_timer matches 10.. run scoreboard players set #rocket_test_launch rkt_hazard_timer 0
execute if score #rocket_test_launch rkt_hazard_timer matches 0 if score #rocket_test_launch rkt_hazard_moved matches 0 run function zbk_der_eisendrache:rocket_test_launch/hazard/relocate_zombies
execute if score #rocket_test_launch rkt_hazard_timer matches 0 as @a[gamemode=adventure,team=!downed,x=37,y=78,z=42,dx=45,dy=30,dz=45] at @s run function zbk_der_eisendrache:rocket_test_launch/hazard/damage_player
