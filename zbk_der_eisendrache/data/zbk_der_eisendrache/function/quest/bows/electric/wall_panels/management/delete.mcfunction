execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$execute unless entity @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"No loaded panel with this ID. Load its location before deleting it.","color":"yellow"}
$kill @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}]
function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
$kill @e[tag=de_el_panel_$(id)_runtime]
$scoreboard players reset #$(id) de_ep_set
$tellraw @s {"text":"Wind panel $(id) removed.","color":"green"}
