function zbk:combat/powerups/fire_sale/events/sound_drops_fire_sale
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
execute as @a at @s run playsound zbk:drops.fire_sale ambient @s ~ ~ ~ 1 1 1
