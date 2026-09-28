# ===================================
# SPAWN MENU - SPAWN ENTITIES
# ===================================
# Creates a physical spawn menu with text_display entities
# Run this command at the location where you want the menu to appear

# Summon title text display (yellow, centered above)
summon text_display ~ ~2.0 ~ {Tags:["spawn_menu","menu_title"],billboard:"center",text:[{"text":"Spawn Menu","color":"yellow","bold":true}],background:0,PersistenceRequired:1b,shadow:1b}

# Summon "Start Game" option (red by default, at eye level)
summon text_display ~ ~1.5 ~ {Tags:["spawn_menu","menu_option_start"],billboard:"center",text:[{"text":"Start Game","color":"red","bold":true}],background:0,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~1.5 ~ {Tags:["spawn_menu","menu_interaction_start"],width:1.5f,height:0.25f,PersistenceRequired:1b}

# Summon "Start (No Cutscene)" option (red by default, below Start Game)
summon text_display ~ ~1.1 ~ {Tags:["spawn_menu","menu_option_skip_cutscene"],billboard:"center",text:[{"text":"Start (No Cutscene)","color":"red","bold":true}],background:0,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~1.1 ~ {Tags:["spawn_menu","menu_interaction_skip_cutscene"],width:1.5f,height:0.25f,PersistenceRequired:1b}

# Summon "Build Kit" option (red by default, below Start No Cutscene)
summon text_display ~ ~0.7 ~ {Tags:["spawn_menu","menu_option_build"],billboard:"center",text:[{"text":"Build Kit","color":"red","bold":true}],background:0,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~0.7 ~ {Tags:["spawn_menu","menu_interaction_build"],width:1.5f,height:0.25f,PersistenceRequired:1b}

# Summon "Menu Music" option (red by default, below Build Kit)
summon text_display ~ ~0.3 ~ {Tags:["spawn_menu","menu_option_music"],billboard:"center",text:[{"text":"Menu Music: OFF","color":"red","bold":true}],background:0,PersistenceRequired:1b,shadow:1b}
summon interaction ~ ~0.3 ~ {Tags:["spawn_menu","menu_interaction_music"],width:1.5f,height:0.25f,PersistenceRequired:1b}

# Confirmation message
tellraw @s [{"text":"[Spawn Menu] ","color":"gold"},{"text":"Menu spawned successfully!","color":"green"}]
