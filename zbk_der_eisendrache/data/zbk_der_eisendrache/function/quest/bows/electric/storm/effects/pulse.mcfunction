# Run as the storm at its own center; restore this storm's owner each pulse.
scoreboard players operation #player stats = @s de_storm_owner
particle minecraft:flash{color:[0.5,0.7,1.0,0.7]} ~ ~1 ~ 1 1 1 0 1 force
execute as @e[type=zombified_piglin,distance=..10,tag=!immune_elements,tag=!immune_guns,tag=!combat_ignore,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/storm/hit
execute as @e[type=wolf,distance=..10,tag=!immune_elements,tag=!immune_guns,tag=!combat_ignore,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/storm/hit
