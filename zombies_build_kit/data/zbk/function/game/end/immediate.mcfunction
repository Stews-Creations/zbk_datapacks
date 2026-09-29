# ===================================
# GAME OVER - TRIGGER (NO CUTSCENE)
# ===================================
# Same as trigger_game_over but always skips the cutscene

# Remove pumpkin fog effect from all players (in case game over during dog round)
item replace entity @a armor.head with air

# Snapshot the round number to storage BEFORE any reset so combat record can display it
execute store result storage zbk:stats last_round int 1 run scoreboard players get #global wave.round

# Stop any currently playing start cutscene/video before routing into game over.
function zbk:map_elements/cutscenes/management/stop_active

# Stop game progression (prevents new wave spawns during cutscene)
scoreboard players set #global game_active 0

# Clear active trip mines immediately on reset/game over.
function zbk:combat/weapons/special_equipment/trip_mine/lifecycle/cleanup

# Stop all in-game sounds before playing game over music
stopsound @a

# Announce to all players
function zbk:debug/error {f:"GAME",m:"Game Over! Resetting..."}

# Skip cutscene - immediate game over
function zbk:map_elements/cutscenes/end_game/flow/skip
