# === TP BACK FROM DOOR STORAGE ===
# Teleports player back to their saved overworld position

# TP back to overworld using saved coords
function zbk:build_kit/management/custom_door/teleport/back_execute with storage zbk:temp tp_back

# Remove slow falling
effect clear @s slow_falling

# Success message
tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleported back!","color":"green"}]
