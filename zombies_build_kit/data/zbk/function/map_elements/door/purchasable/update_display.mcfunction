# === UPDATE DOOR DISPLAY ===
# Spawns text_display entities (front and back) and interaction entity
# Executed as the door marker

# Store the price in a temp scoreboard
scoreboard players set $door_temp door_price 0
execute store result score $door_temp door_price run data get entity @s data.name 1

# ===== SOUTH FACING DOORS (door_south) =====
# Front display
execute if entity @s[tag=door_south] positioned as @e[type=marker,tag=door_display_point,tag=front,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_front"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}
# Back display
execute if entity @s[tag=door_south] positioned as @e[type=marker,tag=door_display_point,tag=back,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_back"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

# ===== WEST FACING DOORS (door_west) =====
# Front display (rotate 90 degrees clockwise from south)
execute if entity @s[tag=door_west] positioned as @e[type=marker,tag=door_display_point,tag=front,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_front"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}
# Back display
execute if entity @s[tag=door_west] positioned as @e[type=marker,tag=door_display_point,tag=back,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_back"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

# ===== NORTH FACING DOORS (door_north) =====
# Front display (no rotation - already facing north)
execute if entity @s[tag=door_north] positioned as @e[type=marker,tag=door_display_point,tag=front,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_front"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}
# Back display (180 degrees)
execute if entity @s[tag=door_north] positioned as @e[type=marker,tag=door_display_point,tag=back,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_back"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

# ===== EAST FACING DOORS (door_east) =====
# Front display (rotate 90 degrees counter-clockwise from south)
execute if entity @s[tag=door_east] positioned as @e[type=marker,tag=door_display_point,tag=front,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_front"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}
# Back display
execute if entity @s[tag=door_east] positioned as @e[type=marker,tag=door_display_point,tag=back,distance=..5,limit=1,sort=nearest] run summon text_display ~ ~ ~ {Tags:["door_text_display","door_ui","door_back"],billboard:"fixed",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

# Set the text component with score display after spawning (for both front and back)
execute as @e[type=text_display,tag=door_text_display,tag=!door_text_set] run data modify entity @s text set value [{"text":"Purchase\n","color":"gold","bold":true},{"score":{"name":"$door_temp","objective":"door_price"},"color":"yellow","bold":true}]
# Make the text glow
execute as @e[type=text_display,tag=door_text_display,tag=!door_text_set] run data modify entity @s text_opacity set value -1b
tag @e[type=text_display,tag=door_text_display,tag=!door_text_set] add door_text_set

# Summon interaction entity at the front marker position for click detection
execute positioned as @e[type=marker,tag=door_display_point,tag=front,distance=..5,limit=1,sort=nearest] run summon minecraft:interaction ~ ~ ~ {width:1.5f,height:1.5f,response:true,Tags:["door_interaction"]}
