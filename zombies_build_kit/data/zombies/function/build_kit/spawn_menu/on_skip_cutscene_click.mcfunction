# === SPAWN MENU - DIRECT INTERACTION: START (NO CUTSCENE) ===
# Reward function for advancement when player right-clicks the Start (No Cutscene) interaction
# @s = the interacting player

# Guard: only fire if this option is currently highlighted
execute unless entity @e[type=text_display,tag=menu_option_skip_cutscene,tag=hovered] run advancement revoke @s only zombies:interaction_menu_skip_cutscene
execute unless entity @e[type=text_display,tag=menu_option_skip_cutscene,tag=hovered] as @e[type=interaction,tag=menu_interaction_skip_cutscene] run data remove entity @s interaction
execute unless entity @e[type=text_display,tag=menu_option_skip_cutscene,tag=hovered] run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1
function zombies:game/management/custom_start/reset
function zombies:game/management/start

# Reset advancement so it can trigger again
advancement revoke @s only zombies:interaction_menu_skip_cutscene
execute as @e[type=interaction,tag=menu_interaction_skip_cutscene] run data remove entity @s interaction
