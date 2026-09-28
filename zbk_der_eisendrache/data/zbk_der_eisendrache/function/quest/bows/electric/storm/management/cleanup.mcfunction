# Transient attacks never survive map selection or game/quest reinitialization.
execute as @e[tag=zbk.enemy_stunned] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/release
execute as @e[type=breeze,tag=de_storm_breeze] run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove_breeze
kill @e[type=marker,tag=de_electric_storm]
stopsound @a master zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_tornado
scoreboard players reset * de_storm_audio
