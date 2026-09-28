# ===================================
# CUSTOM DOOR - CREATE SIGN UI ENTITIES
# ===================================
# Runs as sign marker, at its position. Creates interaction + text display.
# Reads facing direction from marker's data.facing (south/west/north/east).
# Called from: spawning/spawn_sign_place, management/update_display

# Facing south (+Z) — interaction toward -Z
execute if data entity @s data{facing:"south"} run summon minecraft:interaction ~ ~ ~0.5 {width:1f,height:1f,response:true,Tags:["custom_door_sign_interaction"]}
execute if data entity @s data{facing:"south"} run summon text_display ~ ~ ~ {view_range:0.125f,Tags:["custom_door_sign_ui","custom_door_sign_text_set"],billboard:"fixed",Rotation:[180f,0f],background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Purchase\n","color":"gold","bold":true},{"text":"0","color":"yellow","bold":true}]}

# Facing west (-X) — interaction toward +X
execute if data entity @s data{facing:"west"} run summon minecraft:interaction ~-0.5 ~ ~ {width:1f,height:1f,response:true,Tags:["custom_door_sign_interaction"]}
execute if data entity @s data{facing:"west"} run summon text_display ~ ~ ~ {view_range:0.125f,Tags:["custom_door_sign_ui","custom_door_sign_text_set"],billboard:"fixed",Rotation:[-90f,0f],background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Purchase\n","color":"gold","bold":true},{"text":"0","color":"yellow","bold":true}]}

# Facing north (-Z) — interaction toward +Z
execute if data entity @s data{facing:"north"} run summon minecraft:interaction ~ ~ ~-0.5 {width:1f,height:1f,response:true,Tags:["custom_door_sign_interaction"]}
execute if data entity @s data{facing:"north"} run summon text_display ~ ~ ~ {view_range:0.125f,Tags:["custom_door_sign_ui","custom_door_sign_text_set"],billboard:"fixed",Rotation:[0f,0f],background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Purchase\n","color":"gold","bold":true},{"text":"0","color":"yellow","bold":true}]}

# Facing east (+X) — interaction toward -X
execute if data entity @s data{facing:"east"} run summon minecraft:interaction ~0.5 ~ ~ {width:1f,height:1f,response:true,Tags:["custom_door_sign_interaction"]}
execute if data entity @s data{facing:"east"} run summon text_display ~ ~ ~ {view_range:0.125f,Tags:["custom_door_sign_ui","custom_door_sign_text_set"],billboard:"fixed",Rotation:[90f,0f],background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Purchase\n","color":"gold","bold":true},{"text":"0","color":"yellow","bold":true}]}

# Fallback: no facing stored (legacy markers) — use billboard center
execute unless data entity @s data.facing run summon minecraft:interaction ~ ~ ~ {width:1f,height:1f,response:true,Tags:["custom_door_sign_interaction"]}
execute unless data entity @s data.facing run summon text_display ~ ~ ~ {view_range:0.125f,Tags:["custom_door_sign_ui","custom_door_sign_text_set"],billboard:"center",background:0,brightness:{block:8,sky:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},text:[{"text":"Purchase\n","color":"gold","bold":true},{"text":"0","color":"yellow","bold":true}]}

# Link UID
execute store result score #cd_sign_uid global run scoreboard players get @s cd_sign_uid
scoreboard players operation @e[type=text_display,tag=custom_door_sign_ui,distance=..1.5,limit=1,sort=nearest] cd_sign_uid = #cd_sign_uid global
scoreboard players operation @e[type=interaction,tag=custom_door_sign_interaction,distance=..1,limit=1,sort=nearest] cd_sign_uid = #cd_sign_uid global
