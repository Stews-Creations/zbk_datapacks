# === APPLY TRAP COOLDOWN ===
# Applies cooldown to nearest trap entities.
# Variables: cooldown

$execute as @e[type=marker,tag=trap_sign,distance=..20,limit=1,sort=nearest] run data modify entity @s data.cooldown set value $(cooldown)
$execute as @e[type=marker,tag=trap_control,distance=..20,limit=1,sort=nearest] run data modify entity @s data.cooldown set value $(cooldown)

$tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Cooldown set to ","color":"gold"},{"text":"$(cooldown)","color":"yellow"},{"text":" seconds","color":"gold"}]

function zombies:build_kit/management/trap/dialogs/open_config_dialog_refresh
