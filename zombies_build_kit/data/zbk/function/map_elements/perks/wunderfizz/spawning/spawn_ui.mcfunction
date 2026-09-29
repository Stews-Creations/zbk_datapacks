# ===================================
# WUNDERFIZZ - SPAWN UI ELEMENTS
# ===================================
# Purpose: Spawn text display and interaction for Der Wunderfizz
# Called after structure is placed
# ===================================

# Legacy prices retain their offset; v2 prices sit midway up the cabinet front.
# Start empty; on_tick supplies the price when power/location/cycle state permits.
execute unless entity @s[tag=pm_v2] run summon text_display ~ ~-0.5 ~ {Tags:["pm_v2_child","wunderfizz_ui","wunderfizz_text_display"],billboard:"center",background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":""}]}
execute if entity @s[tag=pm_v2] rotated as @s run summon text_display ^ ^-0.75 ^0.0875 {Tags:["pm_v2_label","pm_v2_child","wunderfizz_ui","wunderfizz_text_display"],billboard:"fixed",background:0,shadow:true,view_range:0.0390625f,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.65f,0.65f,0.65f]},text:[{"text":""}]}

# Summon interaction entity for click detection (1 block down)
execute unless entity @s[tag=pm_v2] run summon minecraft:interaction ~ ~-1 ~ {width:1.5f,height:2f,response:true,Tags:["pm_v2_child","wunderfizz_interaction"]}
execute if entity @s[tag=pm_v2] run summon minecraft:interaction ~ ~-2 ~ {width:1.25f,height:2.4f,response:true,Tags:["pm_v2_child","wunderfizz_interaction"]}
execute if entity @s[tag=pm_v2] run function zbk:map_elements/perks/machines/display/label_orientation

# Tag this marker as having UI spawned
tag @s add wunderfizz_ui_spawned

execute if entity @s[tag=pm_v2] run tag @e[tag=pm_v2_child] add pm_v2_runtime
execute if entity @s[tag=pm_v2] run scoreboard players operation @e[tag=pm_v2_child] pm_v2_id = @s pm_v2_id
tag @e[tag=pm_v2_child] remove pm_v2_child
