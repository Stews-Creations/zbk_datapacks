function zombies:debug/event {f:"POWERUP",m:"Double Points!"}

playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1000 1

scoreboard players set global double_points 1

scoreboard players set #double_points timer 600

# Assign order based on how many powerups are currently active
execute if score double_points powerup_order matches 0 run scoreboard players add active_powerups powerup_order 1
execute if score double_points powerup_order matches 0 run scoreboard players operation double_points powerup_order = active_powerups powerup_order

function zombies:combat/powerups/double_points/sound

execute as @a run function zbk:dispatch/voice_event_double_points
