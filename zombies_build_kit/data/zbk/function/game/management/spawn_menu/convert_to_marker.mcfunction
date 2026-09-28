# === CONVERT SPAWN MENU EGG TO ENTITIES ===
# Remove any existing spawn menu (only one allowed)
kill @e[tag=spawn_menu]
kill @e[type=marker,tag=spawn_menu_marker]
function zbk:map_elements/spawn_menu_v2/management/delete

# Create marker at bat location, then spawn the menu entities there
execute as @e[type=minecraft:bat,name="Spawn Menu"] at @s run summon marker ~ ~ ~ {Tags:["spawn_menu_marker"]}
execute as @e[type=minecraft:bat,name="Spawn Menu"] at @s run function zbk:build_kit/spawn_menu/spawn

# Remove the bat
execute as @e[type=minecraft:bat,name="Spawn Menu"] run kill @s

function zbk:debug/info {f:"GAME",m:"Spawn menu placed!"}
