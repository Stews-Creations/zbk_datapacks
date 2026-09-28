# ===================================
# DETECT MANUAL RELOAD (SNEAKING)
# ===================================
# Purpose: Trigger reload when player starts sneaking
#
# Called from: combat/weapons/on_tick.mcfunction
# ===================================

# --- DETECT SNEAK -> MANUAL RELOAD ---
# Trigger: player just started sneaking (was_sneaking=0 + currently sneaking)
# Guards and selected-map input reservations are handled by try_manual_reload.

execute as @a[predicate=zbk:is_sneaking,scores={was_sneaking=0}] at @s run function zbk:combat/weapons/management/try_manual_reload

# --- UPDATE SNEAK STATE ---
execute as @a[predicate=zbk:is_sneaking] run scoreboard players set @s was_sneaking 1
execute as @a[predicate=!zbk:is_sneaking] run scoreboard players set @s was_sneaking 0
