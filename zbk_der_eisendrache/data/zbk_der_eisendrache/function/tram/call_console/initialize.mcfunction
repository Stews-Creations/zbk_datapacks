# Remove derived console displays and rebuild them from persistent markers.
execute as @e[type=minecraft:block_display,tag=tram_call_console_root] at @s on passengers run kill @s
kill @e[type=minecraft:interaction,tag=tram_call_console_runtime]
kill @e[type=minecraft:text_display,tag=tram_call_console_runtime]
kill @e[type=minecraft:block_display,tag=tram_call_console_runtime]
kill @e[type=minecraft:item_display,tag=tram_call_console_runtime]
execute if score #active zbk.de matches 1 as @e[type=minecraft:marker,tag=tram_call_console,limit=1] at @s run function zbk_der_eisendrache:tram/call_console/display/spawn
