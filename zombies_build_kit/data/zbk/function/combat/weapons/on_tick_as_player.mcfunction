# ===================================
# COMBAT WEAPONS SUBMODULE - TICK AS PLAYER
# ===================================
# Purpose: Execute per-player weapon logic (called from execute as @a at @s)
#
# Dependencies: combat/weapons/on_load.mcfunction
# ===================================

# Apply knife damage attribute modifier to player
function zbk:combat/weapons/knife/apply_damage_attribute
function zbk:combat/weapons/special_equipment/rocket_shield/on_tick_as_player

# Give infinite ammo when in lobby (game not active)
execute if score #global game_active matches 0 run function zbk:combat/weapons/management/refill_ammo

# Give infinite ammo to players in creative mode (even when game is active)
execute if entity @s[gamemode=creative] run function zbk:combat/weapons/management/refill_ammo

# Increment melee charge timer (for full-charge hit point detection)
scoreboard players add @s melee_timer 1
