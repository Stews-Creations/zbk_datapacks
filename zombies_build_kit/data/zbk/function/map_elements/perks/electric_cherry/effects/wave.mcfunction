# Same nonlethal stun as Dead Wire overflow; never call its zap/kill path.
$execute as @e[type=zombified_piglin,distance=..$(radius),tag=!combat_ignore,tag=!turned_zombie,tag=!immune_elements,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s unless data entity @s {Health:0.0f} run function zbk:map_elements/perks/electric_cherry/effects/stun
playsound minecraft:block.amethyst_block.chime player @a[distance=..16] ~ ~ ~ 0.7 1.7
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.1 12 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~$(radius) ~0.8 ~ 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~-$(radius) ~0.8 ~ 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~ ~0.8 ~$(radius) 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~ ~0.8 ~-$(radius) 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~$(diagonal) ~0.8 ~$(diagonal) 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~-$(diagonal) ~0.8 ~$(diagonal) 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~$(diagonal) ~0.8 ~-$(diagonal) 0.1 0.15 0.1 0 5 force
$particle minecraft:dust{color:[0.1,0.45,1.0],scale:1.2} ~-$(diagonal) ~0.8 ~-$(diagonal) 0.1 0.15 0.1 0 5 force
