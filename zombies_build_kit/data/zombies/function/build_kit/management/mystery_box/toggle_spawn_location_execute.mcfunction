# === EXECUTE TOGGLE SPAWN LOCATION ===
# Runs as the mystery box location marker - toggles spawn location status

# Store current state in temp
scoreboard players operation #spawn_state temp = @s mystery_box_spawn_location

# If currently a spawn location (1), remove it
execute if score #spawn_state temp matches 1 run scoreboard players set @s mystery_box_spawn_location 0
execute if score #spawn_state temp matches 1 run return 0

# If not a spawn location, set it
scoreboard players set @s mystery_box_spawn_location 1
