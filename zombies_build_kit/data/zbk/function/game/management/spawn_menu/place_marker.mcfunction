# === DETECT AND PLACE SPAWN MENU ===
# Detects when a spawn menu egg is placed and converts it to entities

execute if entity @e[type=minecraft:bat,name="Spawn Menu"] run function zbk:game/management/spawn_menu/convert_to_marker
