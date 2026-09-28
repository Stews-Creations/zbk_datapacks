function zombies:debug/event {f:"POWERUP",m:"Fire Sale!"}

playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1000 1

scoreboard players set global fire_sale 1
scoreboard players set #fire_sale timer 1560

# Spawn fire sale boxes (skips boxes already showing)
function zombies:combat/powerups/fire_sale/activate_boxes

# Assign order based on how many powerups are currently active
execute if score fire_sale powerup_order matches 0 run scoreboard players add active_powerups powerup_order 1
execute if score fire_sale powerup_order matches 0 run scoreboard players operation fire_sale powerup_order = active_powerups powerup_order

stopsound @a ambient zbk:drops.fire_sale
function zombies:combat/powerups/fire_sale/sound

execute as @a run function zbk:dispatch/voice_event_fire_sale
