# Three-second visual-only preview of one loaded panel: 0 off, 1 glow, 2 flash.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_ep_preview temp $(state)
execute unless score #de_ep_preview temp matches 0..2 run return run tellraw @s {"text":"Use state 0 (off), 1 (glow) or 2 (flash).", "color":"yellow"}
$execute unless entity @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Load or place this panel first.","color":"yellow"}
$scoreboard players set @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] de_ep_preview $(state)
$scoreboard players set @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] de_ep_test 60
$execute as @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/display/sync with entity @s data
