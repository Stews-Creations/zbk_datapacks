execute unless function zombies:waves/spawning/zombie/creation/summon_piglin run return 0
return run execute as @e[type=zombified_piglin,tag=wz_new_piglin,limit=1] at @s run function zombies:waves/spawning/zombie/creation/standard
