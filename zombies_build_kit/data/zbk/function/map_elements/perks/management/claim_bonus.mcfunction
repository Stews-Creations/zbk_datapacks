# === CLAIM PERK BONUS ===
# Gives 100 points to the nearest sneaking player and marks this perk's bonus as claimed

# Add 100 points to the nearest sneaking player
scoreboard players add @p[predicate=zbk:is_sneaking] player_points 100

# Play cash sound for the player who claimed the bonus
execute as @p[predicate=zbk:is_sneaking] at @s run function zbk:player/points/audio/cash

# Remove the bonus_available tag so it can't be claimed again
tag @s remove bonus_available

# Notify all players
function zbk:debug/info {f:"PERK",m:"Perk bonus claimed! +100 points"}
