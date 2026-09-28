# Show perk name text display when bottle has settled (claiming phase)
# Called once when transitioning from cycling to claiming

# Summon text display based on current perk value
# Juggernog (0)
execute if score @s wunderfizz_perk matches 0 run summon text_display ~ ~ ~ {Tags:["wunderfizz_perk_name"],text:[{"text":"Juggernog","color":"red","bold":true}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.5f,0f],scale:[0.5f,0.5f,0.5f]},billboard:"center",background:0}

# Speed Cola (1)
execute if score @s wunderfizz_perk matches 1 run summon text_display ~ ~ ~ {Tags:["wunderfizz_perk_name"],text:[{"text":"Speed Cola","color":"green","bold":true}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.5f,0f],scale:[0.5f,0.5f,0.5f]},billboard:"center",background:0}

# Double Tap (2)
execute if score @s wunderfizz_perk matches 2 run summon text_display ~ ~ ~ {Tags:["wunderfizz_perk_name"],text:[{"text":"Double Tap","color":"gold","bold":true}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.5f,0f],scale:[0.5f,0.5f,0.5f]},billboard:"center",background:0}

# Stamina Up (3)
execute if score @s wunderfizz_perk matches 3 run summon text_display ~ ~ ~ {Tags:["wunderfizz_perk_name"],text:[{"text":"Stamina Up","color":"gold","bold":true}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.5f,0f],scale:[0.5f,0.5f,0.5f]},billboard:"center",background:0}

# Quick Revive (4)
execute if score @s wunderfizz_perk matches 4 run summon text_display ~ ~ ~ {Tags:["wunderfizz_perk_name"],text:[{"text":"Quick Revive","color":"aqua","bold":true}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.5f,0f],scale:[0.5f,0.5f,0.5f]},billboard:"center",background:0}

# Mule Kick (5)
execute if score @s wunderfizz_perk matches 5 run summon text_display ~ ~ ~ {Tags:["wunderfizz_perk_name"],text:[{"text":"Mule Kick","color":"dark_green","bold":true}],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.5f,0f],scale:[0.5f,0.5f,0.5f]},billboard:"center",background:0}
