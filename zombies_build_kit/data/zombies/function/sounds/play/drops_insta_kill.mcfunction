function zbk:dispatch/sound_drops_insta_kill
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
execute as @a at @s run playsound zombies:drops.insta_kill ambient @s ~ ~ ~ 1 1 1
