# ===================================
# TELEPORTER - PLACE START MARKER
# ===================================
# Purpose: Summon start marker with default settings at endermite position
# Called as @s = the endermite, at @s = its position
# ===================================

# Summon marker with defaults: price=750, cooldown=30s, duration=5s, mode=1 (two-way), radius=3, recharge_delay=2s, auto_return_timer=30s
summon marker ~ ~ ~ {Tags:["teleporter","tp_start","tp_unlinked"],data:{name:750,cooldown:30,duration:5,mode:1,two_way:1,radius:3,recharge_delay:2,auto_return_timer:30}}

# Summon text display showing price
summon text_display ~ ~1 ~ {Tags:["teleporter_ui","teleporter_text_display"],billboard:"center",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Teleporter\n","color":"light_purple","bold":true},{"text":"750","color":"yellow","bold":true}],text_opacity:127b}

# Summon interaction entity for click detection
summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["teleporter_interaction"]}

playsound minecraft:block.note_block.pling player @a ~ ~ ~ 1 2
tellraw @a [{"text":"[Teleporter] ","color":"light_purple","bold":true},{"text":"Start marker placed with default price of 750!","color":"green"}]
