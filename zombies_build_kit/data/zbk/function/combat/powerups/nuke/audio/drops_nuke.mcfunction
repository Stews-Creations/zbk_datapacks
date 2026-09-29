function zbk:combat/powerups/nuke/events/sound_drops_nuke
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
execute as @a at @s run playsound zbk:drops.nuke ambient @s ~ ~ ~ 1 1 1
