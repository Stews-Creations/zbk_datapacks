# ===================================
# TELEPORTER - UPDATE DISPLAY (END)
# ===================================
# Spawns text_display and interaction entities at end marker
# Executed as the teleporter end marker
# ===================================

# Summon text display (hidden by default, shown when return is ready for two-way)
summon text_display ~ ~1 ~ {Tags:["teleporter_ui","teleporter_end_text_display"],billboard:"center",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text_opacity:-1b}

# Summon interaction entity for click detection (build stick + two-way return)
summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["teleporter_interaction"]}
