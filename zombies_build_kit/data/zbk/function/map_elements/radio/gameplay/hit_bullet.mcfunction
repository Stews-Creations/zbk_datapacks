function zbk:map_elements/radio/events/sound_radio
execute if data storage zbk:events result{blocked:1b} run return 0
# Shooting the reusable radio restarts the shared music cue.
stopsound @a music zbk:radio
playsound zbk:radio music @a ~ ~ ~ 1 1
