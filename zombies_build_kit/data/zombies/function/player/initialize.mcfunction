# ===================================
# PLAYER MODULE - INITIALIZE
# ===================================
# Purpose: Set player system to default values
# Called from on_load.mcfunction and game reset

# Clear all entries (removes offline/old players from sidebar)
scoreboard players reset * player_points

# ===== INITIALIZE ALL CURRENT PLAYERS =====
# Run per-player setup for every online player
# (Late joiners and returning players get this automatically via dp_version mismatch check)
execute as @a run function zombies:player/setup/setup_player

function zombies:debug/info {f:"PLAYER",m:"Player system initialized"}
