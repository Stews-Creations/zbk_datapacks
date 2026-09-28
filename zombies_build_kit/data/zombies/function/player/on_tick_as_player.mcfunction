# ===================================
# PLAYER MODULE - TICK AS PLAYER
# ===================================
# Runs every game tick for each player (called from execute as @a at @s)

# ===== PLAYER SETUP =====
# Assign unique IDs to new players
execute unless score @s id matches 1.. run function zombies:player/setup/setup_uuid
# Re-setup players who missed a datapack reload (e.g. were offline)
execute unless score @s dp_version = #dp_version dp_version run function zombies:player/setup/setup_player

# ===== CORE SYSTEMS =====
function zombies:player/settings/hands/check
function zombies:player/enable_triggers
# Prevent hunger depletion
effect give @s saturation infinite 1 true

# ===== WEAPON SYSTEM =====
# Detect F key weapon swap BEFORE forcing loadout
function zombies:player/swap_weapon/detect

# ===== INVENTORY MANAGEMENT =====
# Force inventory layout (weapons, perks, powerups, empty slots)
function zombies:player/inventory/manager

# ===== HEALTH =====
# If half health show hurt screen
function zombies:player/health/health_manager

# ===== DOWN SYSTEM =====
# Detect low health and down players (only during active game)
execute if score #global game_active matches 1.. if entity @s[scores={health=0..20},team=!downed] run function zombies:player/down_system/on_down

# Run downed player effects and countdown (only during active game)
execute if score #global game_active matches 1.. if entity @s[team=downed] at @s run function zombies:player/down_system/while_down

# ===== ACTIONBAR DISPLAY =====
# Clear once when leaving Adventure; do not repeatedly erase builder messages.
execute if entity @s[tag=zbk_hud_visible,gamemode=!adventure] run title @s actionbar ""
execute if entity @s[gamemode=!adventure] run tag @s remove zbk_hud_visible
# Display ammo count(s) in actionbar (skip during cutscenes)
execute if entity @s[team=!downed,gamemode=adventure] unless score #global cutscene_active matches 1.. run function zombies:player/actionbar/display

# ===== XP BAR DISPLAY =====
# Keep the vanilla XP display empty
function zombies:player/xpbar/display
