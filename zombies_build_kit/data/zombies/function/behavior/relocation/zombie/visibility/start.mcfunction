# Conservative three-height visibility check; a clear path to any part preserves the enemy.
execute if score #visible zr_state matches 1 run return 0
execute unless entity @e[type=zombified_piglin,tag=zr_subject,distance=..128] run return run scoreboard players set #visible zr_state 1
kill @e[type=marker,tag=zr_aim]
execute at @e[type=zombified_piglin,tag=zr_subject,limit=1] run summon marker ~ ~0.1 ~ {Tags:["zr_aim"]}
execute unless entity @e[type=marker,tag=zr_aim] run return run scoreboard players set #visible zr_state 1
execute facing entity @e[type=marker,tag=zr_aim,limit=1] feet run function zombies:behavior/relocation/zombie/visibility/cast
execute as @e[type=marker,tag=zr_aim] at @s run tp @s ~ ~0.8 ~
execute unless score #visible zr_state matches 1 facing entity @e[type=marker,tag=zr_aim,limit=1] feet run function zombies:behavior/relocation/zombie/visibility/cast
execute as @e[type=marker,tag=zr_aim] at @s run tp @s ~ ~0.8 ~
execute unless score #visible zr_state matches 1 facing entity @e[type=marker,tag=zr_aim,limit=1] feet run function zombies:behavior/relocation/zombie/visibility/cast
kill @e[type=marker,tag=zr_aim]
