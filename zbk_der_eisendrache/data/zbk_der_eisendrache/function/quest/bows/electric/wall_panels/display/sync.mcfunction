$execute unless entity @e[type=item_display,tag=de_el_panel_$(id)_runtime] run function zbk_der_eisendrache:quest/bows/electric/wall_panels/spawning/runtime with entity @s data
function zbk_der_eisendrache:quest/bows/electric/wall_panels/animations/update
$execute if score #$(id) de_ep_seen matches 1 unless score @s de_ep_want matches 2 unless score @s de_ep_test matches 1.. run scoreboard players set @s de_ep_want 1
execute if score #electric de_el_progress matches 2.. unless score @s de_ep_want matches 2 unless score @s de_ep_test matches 1.. run scoreboard players set @s de_ep_want 1
execute unless score @s de_ep_state = @s de_ep_want run function zbk_der_eisendrache:quest/bows/electric/wall_panels/display/apply with entity @s data
