# Runs as a persistent platform-door marker.
# Assigns this door to one tram route and synchronizes its runtime leaf controllers.
execute unless score #active zbk.de matches 1 run return 0
$scoreboard players set #tram_door_selected_link global $(id)
scoreboard players operation @s tram_link_id = #tram_door_selected_link global
scoreboard players operation #tram_door_selected_id global = @s tram_door_id
execute as @e[type=block_display,tag=tram_door_panel] if score @s tram_door_id = #tram_door_selected_id global run scoreboard players operation @s tram_link_id = #tram_door_selected_link global
