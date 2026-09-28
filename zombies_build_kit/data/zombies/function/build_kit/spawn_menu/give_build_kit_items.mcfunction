# === SPAWN MENU - DIRECT INTERACTION: BUILD KIT ===
# Reward function for advancement when player right-clicks the Build Kit interaction
# @s = the interacting player

# Guard: only fire if this option is currently highlighted
execute unless entity @e[type=text_display,tag=menu_option_build,tag=hovered] run advancement revoke @s only zombies:interaction_menu_build_kit
execute unless entity @e[type=text_display,tag=menu_option_build,tag=hovered] as @e[type=interaction,tag=menu_interaction_build] run data remove entity @s interaction
execute unless entity @e[type=text_display,tag=menu_option_build,tag=hovered] run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1
function zombies:build_kit/spawn_menu/handlers/give_build_kit_items

# Reset advancement so it can trigger again
advancement revoke @s only zombies:interaction_menu_build_kit
execute as @e[type=interaction,tag=menu_interaction_build] run data remove entity @s interaction
