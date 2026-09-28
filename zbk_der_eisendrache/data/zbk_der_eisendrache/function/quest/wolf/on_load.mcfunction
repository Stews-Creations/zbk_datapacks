# Wolf painting quest scoreboard setup
# Called on datapack load/reload

# Scoreboard for random number generation and shuffling
scoreboard objectives add wolf_random dummy

# Scoreboard for tracking painting state/progress (if needed for future mechanics)
scoreboard objectives add wolf_state dummy

# Scoreboard for storing previous configuration to prevent repeats
scoreboard objectives add wolf_prev_config dummy

# Scoreboard for temporary calculations in shuffle algorithm
scoreboard objectives add wolf_painting_temp dummy

# Initialize shuffle storage
function zbk_der_eisendrache:quest/wolf/shuffle/on_load
