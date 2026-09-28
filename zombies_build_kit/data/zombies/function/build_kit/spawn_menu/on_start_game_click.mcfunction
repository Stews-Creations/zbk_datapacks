# === SPAWN MENU - DIRECT INTERACTION: START GAME ===
# Reward function for advancement when player right-clicks the Start Game interaction
# @s = the interacting player

# Guard: only fire if this option is currently highlighted
execute unless entity @e[type=text_display,tag=menu_option_start,tag=hovered] run advancement revoke @s only zombies:interaction_menu_start_game
execute unless entity @e[type=text_display,tag=menu_option_start,tag=hovered] as @e[type=interaction,tag=menu_interaction_start] run data remove entity @s interaction
execute unless entity @e[type=text_display,tag=menu_option_start,tag=hovered] run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1
function zombies:game/management/custom_start/reset
function zombies:map_elements/cutscenes/start_game/intercept

# Reset advancement so it can trigger again
advancement revoke @s only zombies:interaction_menu_start_game
execute as @e[type=interaction,tag=menu_interaction_start] run data remove entity @s interaction
