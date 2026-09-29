# === APPLY TRAP COST ===
# Applies cost to nearest trap entities (distance-based, like other dialogs).
# Variables: cost

# Update nearest sign/corners/control
$execute as @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] run data modify entity @s data.cost set value $(cost)
$execute as @e[type=marker,tag=trap_corner,distance=..20] run data modify entity @s data.cost set value $(cost)
$execute as @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] run data modify entity @s data.cost set value $(cost)

# Update sign text
$data modify storage minecraft:temp cost set value $(cost)
execute as @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] at @s run function zbk:map_elements/traps/electric/purchasing/update_sign_simple with storage minecraft:temp

# Confirmation
$tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Cost set to ","color":"gold"},{"text":"$(cost)","color":"yellow"},{"text":" points","color":"gold"}]

# Reopen dialog
function zbk:map_elements/traps/electric/build_kit/dialogs/open_config_dialog_refresh
