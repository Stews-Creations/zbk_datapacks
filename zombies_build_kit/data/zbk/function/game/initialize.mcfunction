function zbk:game/reset/begin

# Module-wide reset orchestrator: preserve dependency order when clearing players, entities, and map runtime.
# Feature cleanup belongs to its owner; placement configuration is not disposable runtime.

# ===================================
# GAME INITIALIZE FUNCTION
# ===================================
# Initializes all game systems to default state
# Called from load.mcfunction and during game reset

# Reset ambient music timer so music doesn't immediately play on next game start

# Remove dog round pumpkin from all players
item replace entity @a armor.head with minecraft:air

# ===== CALL ALL MODULE INITIALIZE FUNCTIONS =====
function zbk:map_elements/game_signals/initialize
function zbk:player/initialize
function zbk:player/voice/initialize
function zbk:combat/weapons/special_equipment/trip_mine/lifecycle/cleanup
function zbk:combat/powerups/initialize
function zbk:map_elements/perks/initialize
function zbk:map_elements/power/initialize
function zbk:map_elements/door/initialize
function zbk:map_elements/custom_door/initialize
function zbk:map_elements/traps/initialize
function zbk:map_elements/mystery_box/initialize
function zbk:map_elements/barrier/initialize
function zbk:map_elements/barrier_w3/initialize
function zbk:map_elements/jump_pad/initialize
function zbk:map_elements/teleporter/initialize
function zbk:waves/initialize
function zbk:bosses/initialize
function zbk:map_elements/explosive_barrel/initialize
function zbk:map_elements/floating_objects/initialize
function zbk:map_elements/blocks/initialize
function zbk:map_elements/cutscenes/initialize


# Set game to inactive state
scoreboard players set #global game_active 0

# Teleport all players to worldspawn lobby (if marker exists)
execute if entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1] as @a[tag=!disable_tp] at @e[type=marker,tag=worldspawn,limit=1] run tp @s ~ ~ ~ facing entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1]
execute unless entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1] as @a[tag=!disable_tp] at @e[type=marker,tag=worldspawn,limit=1] run tp @s ~ ~ ~

function zbk:debug/warn {f:"GAME",m:"Game reset/initialized"}
function zbk:map_elements/rocket_shield/initialize
function zbk:map_elements/crafting_bench/management/reset_buildables
function zbk:map_elements/crafting_bench/initialize

function zbk:game/reset/finish
