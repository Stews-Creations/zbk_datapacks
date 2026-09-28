# Reset every panel before copying the owner or measuring player contact.
# Route visits must see the complete proximity pass so overlapping panels retain their original behavior.

execute unless score #active zbk.de matches 1 run return 0
tag @a remove de_el_panel_runner
execute as @e[type=marker,tag=de_el_panel_marker] run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset_presence

# Record the owner after all marker presence and ownership-change resets.
scoreboard players operation #owner de_ep_state = #1 de_bow_owner
execute if score #electric de_el_progress matches 1 as @a[scores={id=1..}] if score @s id = #1 de_bow_owner at @s if dimension minecraft:overworld run function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/player
function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/validate
# Contact is rearmed by actually leaving the radius, not by a one-tick movement stall.
execute as @a[scores={id=1..}] if score @s id = #1 de_bow_owner at @s if dimension minecraft:overworld positioned ~ ~1 ~ as @e[type=marker,tag=de_el_panel_marker,distance=..3] run scoreboard players set @s de_ep_present 1
# Measure from the runner's torso to the panel center.
execute as @a[tag=de_el_panel_runner] at @s positioned ~ ~1 ~ as @e[type=marker,tag=de_el_panel_marker,distance=..3] run scoreboard players set @s de_ep_near 1
execute as @a[tag=de_el_panel_runner] at @s positioned ~ ~1 ~ as @e[type=marker,tag=de_el_panel_marker,distance=..1.5] run scoreboard players set @s de_ep_close 1
execute as @e[type=marker,tag=de_el_panel_marker,scores={de_ep_close=1}] at @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/visit with entity @s data
execute as @e[type=marker,tag=de_el_panel_marker] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/display/sync with entity @s data
