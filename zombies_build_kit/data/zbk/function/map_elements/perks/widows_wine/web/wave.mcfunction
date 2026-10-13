particle minecraft:dust{color:[0.8,0.85,0.95],scale:1.1} ~ ~1 ~ 2 0.5 2 0 45 force
playsound minecraft:block.cobweb.place player @a[distance=..16] ~ ~ ~ 1 0.6
execute as @e[type=zombified_piglin,distance=..6,tag=!combat_ignore,tag=!immune_elements,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] unless data entity @s {Health:0.0f} run function zbk:map_elements/perks/widows_wine/web/by_distance
