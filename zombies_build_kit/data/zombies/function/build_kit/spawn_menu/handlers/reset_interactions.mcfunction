# ===================================
# SPAWN MENU - RESET ALL INTERACTIONS
# ===================================
# Clears interaction data from all menu interaction entities
# Called on datapack reload to ensure fresh state

# Clear Start Game interaction
execute as @e[type=interaction,tag=menu_interaction_start] run data remove entity @s interaction

# Clear Build Kit interaction
execute as @e[type=interaction,tag=menu_interaction_build] run data remove entity @s interaction

# Clear Start (No Cutscene) interaction
execute as @e[type=interaction,tag=menu_interaction_skip_cutscene] run data remove entity @s interaction

# Clear Menu Music interaction
execute as @e[type=interaction,tag=menu_interaction_music] run data remove entity @s interaction

# Revoke advancements from all players
advancement revoke @a only zombies:interaction_menu_start_game
advancement revoke @a only zombies:interaction_menu_skip_cutscene
advancement revoke @a only zombies:interaction_menu_build_kit
advancement revoke @a only zombies:interaction_menu_music

# Notify
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[Menu] ","color":"aqua"},{"text":"Spawn menu interactions reset","color":"green"}]
