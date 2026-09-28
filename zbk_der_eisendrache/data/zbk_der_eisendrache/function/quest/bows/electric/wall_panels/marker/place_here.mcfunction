# Keep the authored wall-facing yaw; runtime creation turns the decorated display face outward.
execute unless block ~ ~ ~ #zbk:raycast_pass run return run tellraw @s {"text":"The selected wall face must have clear space in front of it.","color":"yellow"}
$kill @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}]
function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
$kill @e[tag=de_el_panel_$(id)_runtime]
$summon marker ~ ~ ~ {Tags:["de_el_panel_marker","de_el_panel_new"],data:{id:$(id)}}
tp @e[type=marker,tag=de_el_panel_new,limit=1] ~ ~ ~ ~ 0
scoreboard players set @e[type=marker,tag=de_el_panel_new] de_ep_present 0
scoreboard players set @e[type=marker,tag=de_el_panel_new] de_ep_near 0
scoreboard players set @e[type=marker,tag=de_el_panel_new] de_ep_close 0
scoreboard players set @e[type=marker,tag=de_el_panel_new] de_ep_touch 0
scoreboard players set @e[type=marker,tag=de_el_panel_new] de_ep_flash 0
scoreboard players set @e[type=marker,tag=de_el_panel_new] de_ep_test 0
$scoreboard players set #$(id) de_ep_set 1
execute as @e[type=marker,tag=de_el_panel_new] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/display/sync with entity @s data
tag @e[tag=de_el_panel_new] remove de_el_panel_new
$tellraw @s {"text":"Wind panel $(id) placed. It reacts to the electric owner wall-running after the three fires.","color":"aqua"}
