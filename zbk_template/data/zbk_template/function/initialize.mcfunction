# Called when the provider becomes active and after game reset. Rebuild disposable displays from persistent markers.
# Add your own marker scans here; markers/configuration remain the authoritative saved state.
kill @e[type=minecraft:block_display,tag=zbk_template_demo_display]
execute as @e[type=minecraft:marker,tag=zbk_template_sample] at @s run function zbk_template:marker/rebuild
