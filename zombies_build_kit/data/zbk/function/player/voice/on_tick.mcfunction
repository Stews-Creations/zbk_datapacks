# Decrement shared per-character voice-slot cooldowns (20s lockout across all callout types)
execute if score #voice_1 zbk.voice matches 1.. run scoreboard players remove #voice_1 zbk.voice 1
execute if score #voice_2 zbk.voice matches 1.. run scoreboard players remove #voice_2 zbk.voice 1
execute if score #voice_3 zbk.voice matches 1.. run scoreboard players remove #voice_3 zbk.voice 1
execute if score #voice_4 zbk.voice matches 1.. run scoreboard players remove #voice_4 zbk.voice 1
