function zbk:dispatch/sound_radio_stop
execute if data storage zbk:events result{blocked:1b} run return 0
# Clear the attack once and stop the shared radio cue.
data remove entity @s attack
stopsound @a music zombies:game.disco
