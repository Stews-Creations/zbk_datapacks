# === TRAP ALREADY ACTIVE FAILURE ===
# Called when trying to activate an already-active trap

tellraw @s [{"text":"[TRAP] ","color":"red"},{"text":"Trap is already active!","color":"gold"}]
tag @e[tag=this_trap] remove this_trap
return fail
