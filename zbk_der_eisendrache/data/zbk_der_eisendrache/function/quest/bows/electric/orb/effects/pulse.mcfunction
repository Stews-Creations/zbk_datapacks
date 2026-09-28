# Each orb restores its original shooter before awarding shared combat credit.
scoreboard players operation #player stats = @s de_orb_owner
execute as @e[type=zombified_piglin,distance=..2.5] at @s run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/orb/hit
execute as @e[type=wolf,distance=..2.5] at @s run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/orb/hit
