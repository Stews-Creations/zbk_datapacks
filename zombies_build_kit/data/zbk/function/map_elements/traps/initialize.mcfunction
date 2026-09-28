# ===================================
# TRAPS SUBMODULE - INITIALIZE
# ===================================
# Purpose: Set trap system to default values
# Called from on_load.mcfunction and game reset

# Reset all traps to ready state
execute as @e[type=marker,tag=trap_corner] run tag @s remove trap_active
execute as @e[type=marker,tag=trap_corner] run tag @s remove trap_cooldown
execute as @e[type=marker,tag=trap_corner] run scoreboard players set @s trap_timer 0

function zbk:debug/info {f:"TRAP",m:"All electric traps reset to ready state"}
