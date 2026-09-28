# Run as a storm marker. Remove only its paired visual before deleting the center.
scoreboard players operation #current de_storm_link = @s de_storm_link
execute as @e[type=breeze,tag=de_storm_breeze] if score @s de_storm_link = #current de_storm_link run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove_breeze
execute as @e[tag=zbk.enemy_stunned] if score @s de_storm_link = #current de_storm_link at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/release
kill @s
