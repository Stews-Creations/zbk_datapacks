scoreboard players add #voice_cycle character 1
execute if score #voice_cycle character matches 5.. run scoreboard players set #voice_cycle character 1
execute as @r[gamemode=adventure,scores={character=0}] run scoreboard players operation @s character = #voice_cycle character
execute if entity @a[gamemode=adventure,scores={character=0}] run function zbk_nacht_der_untoten:character/assign_step
