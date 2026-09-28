# === RESET ALL ELECTRIC TRAPS ===
# Resets all electric traps to ready state

# Reset all traps to ready state
execute as @e[type=marker,tag=trap_corner] run tag @s remove trap_active
execute as @e[type=marker,tag=trap_corner] run tag @s remove trap_cooldown
execute as @e[type=marker,tag=trap_corner] run scoreboard players set @s trap_timer 0

# Message
function zbk:debug/warn {f:"TRAP",m:"All electric traps reset to ready state"}
