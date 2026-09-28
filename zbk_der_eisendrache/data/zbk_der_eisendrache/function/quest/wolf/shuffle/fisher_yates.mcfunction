# Fisher-Yates (Durstenfeld) shuffle with validation
# Reshuffles until result doesn't match previous round (max 10 attempts)

# Debug logging removed for brevity

# Save previous shuffle for validation
data modify storage zombies:wolf_shuffle previous set from storage zombies:wolf_shuffle current

# Initialize attempt counter
scoreboard players set #shuffle_attempts wolf_painting_temp 0

# Attempt shuffle with validation
function zbk_der_eisendrache:quest/wolf/shuffle/perform_shuffle
