# ===================================
# COMBAT POWERUPS SUBMODULE - INITIALIZE
# ===================================
# Purpose: Set powerup system to default values
# Called from on_load.mcfunction and game reset

# ===== RESET ACTIVE POWERUPS =====
# Cancel all active powerups on reload/reset
scoreboard players set global fire_sale 0
scoreboard players set global double_points 0
scoreboard players set global insta_kill 0
function zbk:dispatch/extension/combat/powerups/initialize/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Death Machine is per-player; run its cleanup on anyone currently carrying it.
execute as @a[tag=death_machine_active] run function zombies:combat/powerups/death_machine/cleanup

# ===== POWERUP ORDER =====
# Reset powerup order tracking (for inventory display)
scoreboard players set active_powerups powerup_order 0
scoreboard players set fire_sale powerup_order 0
scoreboard players set double_points powerup_order 0
scoreboard players set insta_kill powerup_order 0
scoreboard players set #expired_powerup powerup_order 0

# ===== DROP GATING =====
# Start with req_kills at 0 so first drop is free (no kill gate until first drop spawns)
scoreboard players set #global drop_req_kills 0
scoreboard players set #global drop_round_drops 0

function zombies:debug/info {f:"POWERUP",m:"Powerup system initialized"}
