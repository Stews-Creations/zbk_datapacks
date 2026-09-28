# Compare the hit voxel with the preceding ray voxel to select the actual wall face.
# This temporary probe is removed before placement; authored markers remain the source of truth.
summon marker ~ ~ ~ {Tags:["de_el_panel_face_probe"]}
execute store result score #de_ep_hit_x temp run data get entity @e[type=marker,tag=de_el_panel_face_probe,limit=1] Pos[0]
execute store result score #de_ep_hit_z temp run data get entity @e[type=marker,tag=de_el_panel_face_probe,limit=1] Pos[2]
execute positioned ^ ^ ^-0.1 run tp @e[type=marker,tag=de_el_panel_face_probe,limit=1] ~ ~ ~
execute store result score #de_ep_prev_x temp run data get entity @e[type=marker,tag=de_el_panel_face_probe,limit=1] Pos[0]
execute store result score #de_ep_prev_z temp run data get entity @e[type=marker,tag=de_el_panel_face_probe,limit=1] Pos[2]
kill @e[type=marker,tag=de_el_panel_face_probe]
execute if score #de_ep_hit_x temp > #de_ep_prev_x temp align xyz positioned ~0.5 ~0.5 ~0.5 rotated -90 0 positioned ^ ^ ^-0.58 run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/place_here with storage zombies:de_wind_panel placement
execute if score #de_ep_hit_x temp < #de_ep_prev_x temp align xyz positioned ~0.5 ~0.5 ~0.5 rotated 90 0 positioned ^ ^ ^-0.58 run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/place_here with storage zombies:de_wind_panel placement
execute if score #de_ep_hit_z temp > #de_ep_prev_z temp align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 0 positioned ^ ^ ^-0.58 run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/place_here with storage zombies:de_wind_panel placement
execute if score #de_ep_hit_z temp < #de_ep_prev_z temp align xyz positioned ~0.5 ~0.5 ~0.5 rotated 180 0 positioned ^ ^ ^-0.58 run return run function zbk_der_eisendrache:quest/bows/electric/wall_panels/marker/place_here with storage zombies:de_wind_panel placement
tellraw @s {"text":"Aim at a vertical side of the wall block, rather than its top or bottom.","color":"yellow"}
