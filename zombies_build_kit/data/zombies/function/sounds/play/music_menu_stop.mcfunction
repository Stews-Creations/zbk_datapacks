function zbk:dispatch/sound_music_menu_stop
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
stopsound @a master zombies:game.disco
