# ===================================
# SPAWN MENU - PLAY MENU MUSIC
# ===================================
# Plays looping menu music to players near the spawn menu if music is enabled
# Called every tick from build_kit/on_tick.mcfunction

# Only run if menu music is enabled
execute unless entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] run return fail

# Initialize music timer if not set
execute unless score #menu_music_timer global matches 0.. run scoreboard players set #menu_music_timer global 0

# Increment timer
scoreboard players add #menu_music_timer global 1

# Play music every 3600 ticks (3 minutes = 180 seconds = 3600 ticks)
execute if score #menu_music_timer global matches 3600.. as @e[type=text_display,tag=menu_title,limit=1] at @s run function zombies:sounds/play/music_menu

# Reset timer after playing
execute if score #menu_music_timer global matches 3600.. run scoreboard players set #menu_music_timer global 0
