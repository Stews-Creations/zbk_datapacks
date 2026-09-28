# ===================================
# TELEPORTER - UPDATE DISPLAY (START)
# ===================================
# Spawns text_display and interaction entities at start marker
# Executed as the teleporter start marker
# ===================================

# Store the price in a temp scoreboard
scoreboard players set $teleporter_temp teleporter_price 0
execute store result score $teleporter_temp teleporter_price run data get entity @s data.name 1

# Summon text display showing price
summon text_display ~ ~1 ~ {Tags:["teleporter_ui","teleporter_text_display","teleporter_temp"],billboard:"center",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

# Set the text component with score display
execute as @e[type=text_display,tag=teleporter_temp] run data modify entity @s text set value [{"text":"Teleporter\n","color":"light_purple","bold":true},{"score":{"name":"$teleporter_temp","objective":"teleporter_price"},"color":"yellow","bold":true}]

# Show text display
execute as @e[type=text_display,tag=teleporter_temp] run data modify entity @s text_opacity set value 127b

# Remove temp tag
tag @e[type=text_display,tag=teleporter_temp] remove teleporter_temp

# Summon interaction entity for click detection
summon minecraft:interaction ~ ~0.5 ~ {width:1.5f,height:1.5f,response:true,Tags:["teleporter_interaction"]}
