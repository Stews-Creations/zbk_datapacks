# === APPLY TRAP DURATION ===
# Applies duration to nearest trap entities.
# Variables: duration

$execute as @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] run data modify entity @s data.duration set value $(duration)
$execute as @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] run data modify entity @s data.duration set value $(duration)

$tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Duration set to ","color":"gold"},{"text":"$(duration)","color":"yellow"},{"text":" seconds","color":"gold"}]

function zbk:build_kit/management/trap/dialogs/open_config_dialog_refresh
