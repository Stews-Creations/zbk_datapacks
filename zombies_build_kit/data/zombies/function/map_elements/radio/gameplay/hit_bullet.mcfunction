function zbk:dispatch/sound_radio
execute if data storage zbk:events result{blocked:1b} run return 0
# Shooting the reusable radio restarts the shared music cue.
stopsound @a music zombies:game.disco
playsound zombies:game.disco music @a ~ ~ ~ 1 1
