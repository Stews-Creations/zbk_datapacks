# === ASSIGN PLAYER TO NEXT SPAWN POINT ===
# Runs as each player with spawn_pending tag
# Increments round-robin index and teleports player to matching marker

# Increment the round-robin index
scoreboard players add #spawn_point_idx spawn_point_idx 1

# If index exceeds total markers, wrap back to 1
execute if score #spawn_point_idx spawn_point_idx > #spawn_point_total spawn_point_id run scoreboard players set #spawn_point_idx spawn_point_idx 1

# Copy the target index to this player's score for matching
scoreboard players operation @s spawn_point_idx = #spawn_point_idx spawn_point_idx

# Teleport to the marker whose ID matches our assigned index (skip if player has disable_tp)
execute unless entity @s[tag=disable_tp] at @e[type=marker,tag=spawn_point_marker] if score @s spawn_point_idx = @e[type=marker,tag=spawn_point_marker,sort=nearest,limit=1] spawn_point_id run tp @s ~ ~ ~

# Remove pending tag
tag @s remove spawn_pending
