# Calculate knife damage based on current round
# Formula: (Round + 20) / Round
# This ensures N hits to kill on round N

# Handle pre-round 1 (set to round 1 damage)
execute if score #global wave.round matches ..0 run scoreboard players set #global knife.damage 21

# Calculate for rounds 1+ using ceiling division
# Formula: ceil((Round + 20) / Round) = ((Round + 20) + (Round - 1)) / Round
execute if score #global wave.round matches 1.. run scoreboard players operation #global knife.damage = #global wave.round
execute if score #global wave.round matches 1.. run scoreboard players add #global knife.damage 20
execute if score #global wave.round matches 1.. run scoreboard players operation #temp knife.damage = #global wave.round
execute if score #global wave.round matches 1.. run scoreboard players remove #temp knife.damage 1
execute if score #global wave.round matches 1.. run scoreboard players operation #global knife.damage += #temp knife.damage
execute if score #global wave.round matches 1.. run scoreboard players operation #global knife.damage /= #global wave.round
