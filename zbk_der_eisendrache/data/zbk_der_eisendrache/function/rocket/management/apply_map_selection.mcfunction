# This persistent rocket belongs to the active Der Eisendrache provider.
# Rebuild or remove it according to this pack's stored map selection.

execute unless score #active zbk.de matches 1 run function zbk_der_eisendrache:rocket/management/delete
execute if score #active zbk.de matches 1 unless entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] positioned 86 76 -24 run function zbk_der_eisendrache:rocket/spawning/summon
execute if score #active zbk.de matches 1 if entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] run data merge entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] {teleport_duration:20}
