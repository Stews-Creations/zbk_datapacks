# Look anywhere on the desired vertical wall block within 8 blocks. Placement snaps to its face center. IDs 1 through 5.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache before placing wind panels.","color":"yellow"}
execute unless dimension minecraft:overworld run return 0
$scoreboard players set #de_ep_id temp $(id)
execute unless score #de_ep_id temp matches 1..5 run return run tellraw @s {"text":"Use panel id 1 through 5.","color":"yellow"}
$execute if score #$(id) de_ep_set matches 1 unless entity @e[type=marker,tag=de_el_panel_marker,nbt={data:{id:$(id)}}] run return run tellraw @s {"text":"Load the old panel before moving it. If you manually deleted its marker, use wall_panels/management/unregister with this ID.","color":"yellow"}
$data modify storage zombies:de_wind_panel placement set value {id:$(id)}
scoreboard players set #de_ep_ray temp 0
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/look
