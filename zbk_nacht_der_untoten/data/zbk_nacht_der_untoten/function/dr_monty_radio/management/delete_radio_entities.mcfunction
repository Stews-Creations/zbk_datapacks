tag @e[type=minecraft:block_display,tag=zbk_nacht_radio_display,distance=..3] add zbk_nacht_radio_cleanup
execute as @e[type=minecraft:block_display,tag=zbk_nacht_radio_display,distance=..3] on passengers run tag @s add zbk_nacht_radio_cleanup
kill @e[tag=zbk_nacht_radio_cleanup]
kill @e[type=minecraft:interaction,tag=zbk_nacht_radio_interaction,distance=..3]
kill @s
