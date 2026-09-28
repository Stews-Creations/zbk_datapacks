# ===================================
# WUNDERFIZZ - SPAWN UI ELEMENTS
# ===================================
# Purpose: Spawn text display and interaction for Der Wunderfizz
# Called after structure is placed
# ===================================

# Summon text display showing price (lowered by 0.5, starts empty - will be filled by on_tick when power is on)
summon text_display ~ ~-0.5 ~ {Tags:["wunderfizz_ui","wunderfizz_text_display"],billboard:"center",background:0,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":""}]}

# Summon interaction entity for click detection (1 block down)
summon minecraft:interaction ~ ~-1 ~ {width:1.5f,height:2f,response:true,Tags:["wunderfizz_interaction"]}

# Tag this marker as having UI spawned
tag @s add wunderfizz_ui_spawned
