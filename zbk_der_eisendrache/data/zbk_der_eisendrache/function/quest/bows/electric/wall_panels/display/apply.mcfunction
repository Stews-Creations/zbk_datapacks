$execute if score @s de_ep_want matches 0 run data modify entity @e[type=item_display,tag=de_el_panel_$(id)_runtime,limit=1] item.components."minecraft:item_model" set value "zbk_der_eisendrache:quest/bows/electric/wall_panels/off"
$execute if score @s de_ep_want matches 1 run data modify entity @e[type=item_display,tag=de_el_panel_$(id)_runtime,limit=1] item.components."minecraft:item_model" set value "zbk_der_eisendrache:quest/bows/electric/wall_panels/glow"
$execute if score @s de_ep_want matches 2 run data modify entity @e[type=item_display,tag=de_el_panel_$(id)_runtime,limit=1] item.components."minecraft:item_model" set value "zbk_der_eisendrache:quest/bows/electric/wall_panels/flash"
scoreboard players operation @s de_ep_state = @s de_ep_want
