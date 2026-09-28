# === SPAWN MENU - DIRECT INTERACTION: TOGGLE MUSIC ===
# Reward function for advancement when player right-clicks the Menu Music interaction
# @s = the interacting player

# Guard: only fire if this option is currently highlighted
execute unless entity @e[type=text_display,tag=menu_option_music,tag=hovered] run advancement revoke @s only zombies:interaction_menu_music
execute unless entity @e[type=text_display,tag=menu_option_music,tag=hovered] as @e[type=interaction,tag=menu_interaction_music] run data remove entity @s interaction
execute unless entity @e[type=text_display,tag=menu_option_music,tag=hovered] run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1
function zombies:build_kit/spawn_menu/music/toggle_menu_music

# Reset advancement so it can trigger again
advancement revoke @s only zombies:interaction_menu_music
execute as @e[type=interaction,tag=menu_interaction_music] run data remove entity @s interaction
