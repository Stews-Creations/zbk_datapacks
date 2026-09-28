function zbk:dispatch/sound_music_menu
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zombies:game.disco master @a[distance=..20] ~ ~ ~ 1 1
