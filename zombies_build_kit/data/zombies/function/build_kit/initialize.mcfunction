# ===================================
# BUILD KIT - INITIALIZE
# ===================================
# Purpose: Per-player build kit scoreboard defaults for @s.
# Trigger enables are in build_kit/enable_triggers.mcfunction.
# Called from: player/setup/setup_player
# ===================================

# ===== BUILD MANAGER =====
scoreboard players set @s build_manager_pending 0
scoreboard players set @s build_manager_trigger_lock 0
advancement revoke @s only zombies:build_manager
advancement revoke @s only zombies:build_manager_cooldown

# ===== MOB IMMUNITY TOOL =====
execute unless score @s mob_immunity_tool_mode matches 0..7 run scoreboard players set @s mob_immunity_tool_mode 5
scoreboard players set @s mob_immunity_tool_pending 0
scoreboard players set @s mob_immunity_tool_lock 0
advancement revoke @s only zombies:mob_immunity_tool
advancement revoke @s only zombies:mob_immunity_tool_cooldown

# ===== DEBUG CONTROLS =====
execute unless score @s debug_level matches 1.. run scoreboard players set @s debug_level 4

# ===== GUN VISIBILITY =====
execute unless score @s hide_gun matches 0.. run scoreboard players set @s hide_gun 0

# Reset buildable requests and enable newly added controls on reload.
scoreboard players set @s buildables_action 0
scoreboard players enable @s buildables_action
