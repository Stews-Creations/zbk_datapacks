# Executed as the newly summoned marker, never a nearest-entity lookup.
tag @s add de_electric_storm
scoreboard players operation @s de_storm_owner = #player stats
scoreboard players set @s de_storm_life 200

# Pair a visual breeze with this specific storm, including repeated shots by one owner.
scoreboard players add #next de_storm_link 1
scoreboard players operation @s de_storm_link = #next de_storm_link
execute summon minecraft:breeze run function zbk_der_eisendrache:quest/bows/electric/storm/spawning/breeze
