function zbk:dispatch/sound_radio
execute if data storage zbk:events result{blocked:1b} run return 0
# Shooting the reusable radio restarts the shared music cue.
stopsound @a music zbk:game.disco
playsound zbk:game.disco music @a ~ ~ ~ 1 1
