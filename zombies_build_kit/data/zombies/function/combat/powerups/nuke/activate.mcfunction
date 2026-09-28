function zombies:debug/event {f:"POWERUP",m:"Nuke!"}

playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1000 1

# scoreboard players set global zombie_count_temp 0

execute as @e[type=zombified_piglin,tag=!immune_nuke] run scoreboard players add @a player_points 100

# Clean up crawler displays before killing all zombified piglins
execute as @e[type=zombified_piglin,tag=crawler_ai,tag=!immune_nuke] run function zombies:behavior/crawler/remove_paired_display

kill @e[type=zombified_piglin,tag=!immune_nuke]

function zombies:combat/powerups/nuke/sound

execute as @a run function zbk:dispatch/voice_event_nuke
