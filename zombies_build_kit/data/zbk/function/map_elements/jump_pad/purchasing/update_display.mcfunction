# ===================================
# JUMP PAD - UPDATE DISPLAY
# ===================================
# Spawns text_display and interaction entities
# Executed as the jump pad start marker
# ===================================

# Store the price in a temp scoreboard
scoreboard players set $jump_pad_temp jump_pad_price 0
execute store result score $jump_pad_temp jump_pad_price run data get entity @s data.name 1

# Summon text display showing price
summon text_display ~ ~1 ~ {Tags:["jump_pad_ui","jump_pad_text_display","jump_pad_temp"],billboard:"center",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

# Set the text component with score display
execute as @e[type=text_display,tag=jump_pad_temp] run data modify entity @s text set value [{"text":"Jump Pad\n","color":"aqua","bold":true},{"score":{"name":"$jump_pad_temp","objective":"jump_pad_price"},"color":"yellow","bold":true}]

# Hide text display by default (will be shown for linked jump pads in on_tick or via toggle)
execute as @e[type=text_display,tag=jump_pad_temp] run data modify entity @s text_opacity set value -1b

# Remove temp tag
tag @e[type=text_display,tag=jump_pad_temp] remove jump_pad_temp

# Summon interaction entity for click detection
summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["jump_pad_interaction"]}
