execute if data storage zbk:events stack[0] run return 0
execute if score #global game_active matches 1 run return 0
# Match setup runs only after the start request or cutscene continuation has accepted it.
execute unless score #continuing zbk.lifecycle matches 1 run return 0
data modify storage zbk:state reason set value "new_game"

# Clear any in-progress intro/cutscene before normal start setup.
function zbk:map_elements/cutscenes/management/stop_active

# Clear stale title content and restore standard timing even when this start does not play a cutscene.
title @a clear
title @a times 10 70 20

# Stop all sounds (end game music, etc.)
stopsound @a

# Initialize game systems (resets weapons, perks, etc.).
function zbk:game/initialize

# Custom test starts set the round to one before the requested value.
# The scheduled start_round function increments it when the round begins.
execute unless score #global game.start_round matches 1.. run scoreboard players set #global game.start_round 1
execute if score #global game.start_round matches 1000.. run scoreboard players set #global game.start_round 999
scoreboard players operation #global wave.round = #global game.start_round
scoreboard players remove #global wave.round 1
scoreboard players set #global game.start_round 1

# Kill any active powerup drops from previous game
kill @e[type=item_display,tag=pickup_item]

# Set players to adventure mode and clear inventory
gamemode adventure @a
execute as @a[gamemode=adventure] run clear @s
team join no_friendly_fire_team @a

# Set game to active state (after initialize sets it to 0)
scoreboard players set #global game_active 1

# Turn off zone particle highlight when game starts
scoreboard players set #highlight_zone global -1

# Teleport all players to spawn point
function zbk:game/spawn_points/players/tp_all_players

# Detect game mode (solo vs co-op)
function zbk:game/start/detect_mode

# Reset player stats and capture player names for Combat Record
function zbk:player/stats/initialize
function zbk:player/stats/capture/capture_players

# Update Quick Revive price display based on game mode
function zbk:map_elements/perks/quick_revive/update_price_display

function zbk:player/voice/management/assign

# Play start game sound to all players
function zbk:waves/audio/round_start

function zbk:debug/event {f:"GAME",m:"Game started!"}

# Fire game start signals
function zbk:map_elements/game_signals/runtime/fire_game_start

# If power is not required, fire power on pulse at game start (power is always on)
execute if score #power_required power matches 0 run function zbk:map_elements/game_signals/runtime/fire_power_on


# Start wave system
schedule function zbk:waves/management/rounds/start_round 4s

function zbk:game/events/game_start
