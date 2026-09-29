# Decrement shared per-character voice-slot cooldowns (20s lockout across all callout types)
execute if score #voice_1 zbk.de matches 1.. run scoreboard players remove #voice_1 zbk.de 1
execute if score #voice_2 zbk.de matches 1.. run scoreboard players remove #voice_2 zbk.de 1
execute if score #voice_3 zbk.de matches 1.. run scoreboard players remove #voice_3 zbk.de 1
execute if score #voice_4 zbk.de matches 1.. run scoreboard players remove #voice_4 zbk.de 1
