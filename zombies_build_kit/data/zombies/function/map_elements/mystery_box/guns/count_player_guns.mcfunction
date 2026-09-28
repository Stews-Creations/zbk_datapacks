# Count how many guns a player currently has across all slots
# Context: Runs as the player (@s)
# Returns: Gun count via return value (stored in #gun_count temp)

# Initialize count to 0
scoreboard players set #gun_count temp 0

# Count guns in each slot (any gun score >= 1 means that slot has a gun)
execute if score @s gun_1 matches 1.. run scoreboard players add #gun_count temp 1
execute if score @s gun_2 matches 1.. run scoreboard players add #gun_count temp 1
execute if score @s gun_3 matches 1.. run scoreboard players add #gun_count temp 1

# Return the count
return run scoreboard players get #gun_count temp
