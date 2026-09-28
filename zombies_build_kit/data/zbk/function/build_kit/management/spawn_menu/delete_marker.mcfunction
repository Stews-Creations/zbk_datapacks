# === DELETE SPAWN MENU ===
# Kills ALL spawn menu entities (text_displays, interactions, and the marker)

kill @e[tag=spawn_menu]
kill @e[type=marker,tag=spawn_menu_marker]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Spawn menu deleted.","color":"red"}]
