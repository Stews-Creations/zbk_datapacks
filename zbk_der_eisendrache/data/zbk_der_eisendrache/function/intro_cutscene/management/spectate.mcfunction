# Re-apply spectator camera after the game-mode switch has settled client-side.
execute unless score #active zbk.de matches 1 run return 0
gamemode spectator @a
execute as @a run spectate @e[type=minecraft:armor_stand,tag=intro_cutscene,limit=1]
