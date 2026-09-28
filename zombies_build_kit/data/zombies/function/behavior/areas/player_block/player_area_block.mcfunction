execute as @a[tag=!disable_tp] at @s if block ~ ~ ~ minecraft:light[level=5] positioned as @e[type=marker,tag=player_block,sort=nearest,limit=1] run tp @s ~ ~ ~ ~ ~
