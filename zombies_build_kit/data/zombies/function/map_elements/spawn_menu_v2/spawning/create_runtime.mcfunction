# Build the derived displays and interaction hitboxes at the marker.
# @s = spawn_menu_v2_marker

summon text_display ~ ~2.0 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_title"],billboard:"center",text:[{"text":"ZOMBIES","color":"gold","bold":true}],background:1073741824,PersistenceRequired:1b,shadow:1b}

summon text_display ~ ~1.5 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_option_start"],billboard:"center",text:[{"text":"START GAME","color":"white","bold":true}],background:1073741824,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~1.5 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_interaction","spawn_menu_v2_interaction_start"],width:1.5f,height:0.25f,PersistenceRequired:1b}

summon text_display ~ ~1.1 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_option_cutscene"],billboard:"center",text:[{"text":"Cutscene   ","color":"gray"},{"text":"ON","color":"green"}],background:1073741824,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~1.1 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_interaction","spawn_menu_v2_interaction_cutscene"],width:1.5f,height:0.25f,PersistenceRequired:1b}

summon text_display ~ ~0.7 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_option_music"],billboard:"center",text:[{"text":"Music      ","color":"gray"},{"text":"OFF","color":"dark_gray"}],background:1073741824,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~0.7 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_interaction","spawn_menu_v2_interaction_music"],width:1.5f,height:0.25f,PersistenceRequired:1b}

summon text_display ~ ~0.3 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_option_help"],billboard:"center",text:[{"text":"Help","color":"gray"}],background:1073741824,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~0.3 ~ {Tags:["spawn_menu_v2_runtime","spawn_menu_v2_interaction","spawn_menu_v2_interaction_help"],width:1.5f,height:0.25f,PersistenceRequired:1b}

execute as @e[type=text_display,tag=spawn_menu_v2_option_cutscene,distance=..3,limit=1,sort=nearest] run function zombies:map_elements/spawn_menu_v2/display/refresh_cutscene
execute as @e[type=text_display,tag=spawn_menu_v2_option_music,distance=..3,limit=1,sort=nearest] run function zombies:map_elements/spawn_menu_v2/display/refresh_music
