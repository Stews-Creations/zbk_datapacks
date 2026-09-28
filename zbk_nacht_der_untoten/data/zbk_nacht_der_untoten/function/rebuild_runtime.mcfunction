execute as @e[type=minecraft:block_display,tag=zbk_nacht_radio_display] on passengers run kill @s
kill @e[type=minecraft:block_display,tag=zbk_nacht_radio_display]
kill @e[type=minecraft:interaction,tag=zbk_nacht_radio_interaction]
execute if score #active zbk.nacht matches 1 run function zbk_nacht_der_untoten:radio/spawning/reconstruct
