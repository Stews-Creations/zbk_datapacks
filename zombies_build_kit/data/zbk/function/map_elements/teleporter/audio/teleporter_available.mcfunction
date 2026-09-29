function zbk:map_elements/teleporter/events/sound_teleporter_available
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:teleporter.available master @s ~ ~ ~ 0.5 1
