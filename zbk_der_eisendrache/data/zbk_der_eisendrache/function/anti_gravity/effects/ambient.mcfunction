# Follow each eligible player with the established Nacht anti-gravity palette.
# Explicit particle targets keep every player's view independent in multiplayer.
execute as @a[tag=de_ag_effects] at @s run particle minecraft:dust_color_transition{from_color:[0.290,0.455,1.000],to_color:[0.800,0.100,1.000],scale:1.2} ~ ~1 ~ 5 5 5 0.01 10 normal @s
execute as @a[tag=de_ag_effects] at @s run particle minecraft:portal ~ ~1 ~ 5 5 5 0.02 2 normal @s
execute if score #tick tick matches 0..5 as @a[tag=de_ag_effects] at @s run particle minecraft:dust{color:[1.000,0.900,0.500],scale:2.5} ~ ~1 ~ 1.5 1.5 1.5 0 4 normal @s
