# ===================================
# GAME OVER - TRIGGER
# ===================================
# Called when all players are downed
# Routes through cutscene system if end game cutscene markers exist

execute unless score #global game_active matches 1 run return 0
data modify storage zbk:state reason set value "game_over"
scoreboard players set #global game_active 0
function zbk:game/events/game_end

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

# Clean up downed body armor stands before players enter spectator (otherwise visible)
kill @e[type=armor_stand,tag=downed_body]

# Announce to all players
function zbk:debug/error {f:"GAME",m:"Game Over! Resetting..."}

# Skip cutscene if any player has the skip_end_cutscene toggle
execute if entity @a[tag=skip_end_cutscene,limit=1] run return run function zbk:map_elements/cutscenes/end_game/flow/skip

# Priority 1: Timed end-game cutscene marker
execute if entity @e[type=marker,tag=cutscene_end_timed,limit=1] run return run function zbk:map_elements/cutscenes/end_game/flow/start_timed

# Priority 2: Pan end-game cutscene markers (both must exist)
execute if entity @e[type=marker,tag=cutscene_end_start,limit=1] if entity @e[type=marker,tag=cutscene_end_finish,limit=1] run return run function zbk:map_elements/cutscenes/end_game/flow/start

# No cutscene markers - immediate game over
function zbk:map_elements/cutscenes/end_game/flow/skip
