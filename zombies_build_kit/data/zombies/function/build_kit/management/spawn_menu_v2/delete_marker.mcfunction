# Delete the selected v2 spawn menu and its derived runtime entities.

function zombies:map_elements/spawn_menu_v2/management/delete
tag @e[tag=open_dialog] remove open_dialog
tellraw @s [{"text":"[Spawn Menu] ","color":"gold"},{"text":"New spawn menu deleted","color":"yellow"}]
