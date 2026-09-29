function zbk:map_elements/spawn_menu_v2/events/sound_music_menu
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:music.menu music @a ~ ~ ~ 1 1
