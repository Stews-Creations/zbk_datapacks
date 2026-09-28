tag @s add de_electric_orb
data modify entity @s data.sound_listeners set value []
scoreboard players operation @s de_orb_owner = #player stats
scoreboard players set @s de_orb_life 60
