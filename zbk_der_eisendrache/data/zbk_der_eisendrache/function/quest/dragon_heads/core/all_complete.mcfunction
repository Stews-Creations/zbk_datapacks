# All 3 Dragon Heads Complete!
# This runs once when all 3 heads are finished

# Set the global completion flag
scoreboard players set #all_dragons_complete dragon_heads_complete 1

# Play completion sound from each dragon head location
execute as @e[tag=quest_dragon_head] at @s run playsound zbk_der_eisendrache:dragon.dragon_end master @a ~ ~ ~ 0.5 1

# Debug message
function zbk:debug/event {f:"QUEST",m:"ALL 3 DRAGON HEADS COMPLETE!"}

# Notify all players
tellraw @a[tag=debug] [{"text":"","color":"gold"},{"text":"All Dragon Heads have been completed!","color":"green","bold":true}]

# Spawn the dragon bow at marker location
execute at @e[tag=quest_dragon_bow_spawn,limit=1] run function zbk_der_eisendrache:quest/bows/default/spawn
