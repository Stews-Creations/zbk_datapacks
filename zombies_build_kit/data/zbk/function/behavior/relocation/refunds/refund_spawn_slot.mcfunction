# Return one consumed non-boss enemy slot to the wave spawner.

scoreboard players remove #global wave.spawned 1
execute if score #global wave.spawned matches ..-1 run scoreboard players set #global wave.spawned 0
execute if score #global wave.is_active matches 3 run scoreboard players set #global wave.is_active 2
