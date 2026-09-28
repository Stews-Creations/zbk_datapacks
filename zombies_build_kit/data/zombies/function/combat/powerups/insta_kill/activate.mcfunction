function zombies:debug/event {f:"POWERUP",m:"Instant Kill!"}

playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1000 1

scoreboard players set global insta_kill 1

scoreboard players set #insta_kill timer 600

# Assign order based on how many powerups are currently active
execute if score insta_kill powerup_order matches 0 run scoreboard players add active_powerups powerup_order 1
execute if score insta_kill powerup_order matches 0 run scoreboard players operation insta_kill powerup_order = active_powerups powerup_order

effect give @a strength infinite 255 true

function zombies:combat/powerups/insta_kill/sound

execute as @a run function zbk:dispatch/voice_event_insta_kill
