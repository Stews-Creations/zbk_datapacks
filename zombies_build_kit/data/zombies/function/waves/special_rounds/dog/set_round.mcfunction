# === SET DOG ROUND ===
# Purpose: Mark this round as a dog round and calculate next dog round
# Called when current round matches next_dog

# Set dog round flag
scoreboard players set #global wave.is_dog_round 1

function zombies:debug/event {f:"WAVE",m:"Dog round started!"}

# Override spawn count with player-based calculation (6 dogs per player)
scoreboard players set #global wave.spawn_count 0
execute as @a run scoreboard players add #global wave.spawn_count 6

# Add configured interval to current round to get next dog round
execute unless score #global wave.dog_round_interval matches 1.. run scoreboard players set #global wave.dog_round_interval 5
scoreboard players operation #global wave.next_dog = #global wave.round
scoreboard players operation #global wave.next_dog += #global wave.dog_round_interval

execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Waves] ","color":"gold"},{"text":"Next dog round: ","color":"white"},{"score":{"name":"#global","objective":"wave.next_dog"},"color":"yellow"}]
