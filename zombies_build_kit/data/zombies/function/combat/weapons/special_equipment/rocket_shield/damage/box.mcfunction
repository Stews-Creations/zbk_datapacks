# Selector delta 0 spans one block; delta 2 spans three blocks.
$execute positioned $(x) ~ $(z) as @e[type=zombified_piglin,dx=$(dx),dy=1,dz=$(dz)] at @s run function zombies:combat/weapons/special_equipment/rocket_shield/damage/kill
$execute positioned $(x) ~ $(z) as @e[type=wolf,tag=wave_dog,dx=$(dx),dy=1,dz=$(dz)] at @s run function zombies:combat/weapons/special_equipment/rocket_shield/damage/kill
