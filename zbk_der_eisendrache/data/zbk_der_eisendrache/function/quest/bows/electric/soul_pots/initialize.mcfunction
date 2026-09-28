# Rebuild presentation without clearing saved soul counts or placements.
kill @e[tag=de_es_orb]
scoreboard players set #fx de_es_age 0
scoreboard players reset * de_ec_pot
scoreboard players reset * de_ec_shot
stopsound @a master zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_arrowhead
scoreboard players reset * de_ec_audio
