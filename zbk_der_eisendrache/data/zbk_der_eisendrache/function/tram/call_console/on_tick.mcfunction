# Keep the black-panel readout synchronized with the temporary Tram 2 manager state.
execute as @e[type=minecraft:text_display,tag=tram_call_console_status] at @s run function zbk_der_eisendrache:tram/call_console/display/update_status

# Detect right-clicks recorded by the console interaction entity.
execute as @e[type=minecraft:interaction,tag=tram_call_console_interaction] at @s if data entity @s interaction run function zbk_der_eisendrache:tram/call_console/interactions/interact

# Weapon hits must never linger as console state or trigger its call manager.
execute as @e[type=minecraft:interaction,tag=tram_call_console_interaction] if data entity @s attack run data remove entity @s attack
