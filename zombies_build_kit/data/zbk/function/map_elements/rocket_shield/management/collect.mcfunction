# Idempotent shared pickup. Keep current position at the clicked interaction.
$execute if score #$(part) rs_collected matches 1 run return 0
$scoreboard players set #$(part) rs_collected 1
$kill @e[tag=rs_$(part)_runtime]
scoreboard players set @a rs_ui_preview 1
execute as @a at @s run function zbk:player/inventory/rocket_shield/update
execute as @a at @s run playsound minecraft:entity.item.pickup master @s ~ ~ ~ 0.7 1.15


function zbk:map_elements/crafting_bench/management/check_ready
