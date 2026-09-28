execute unless score #active zbk.de matches 1 if entity @e[type=item_display,tag=fuse] run scoreboard players set #global de_fuse 0
execute unless score #active zbk.de matches 1 as @e[type=item_display,tag=fuse] run kill @s
