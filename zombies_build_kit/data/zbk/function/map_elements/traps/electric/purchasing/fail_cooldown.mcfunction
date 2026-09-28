# === TRAP ON COOLDOWN FAILURE ===
# Called when trying to activate a trap that's on cooldown

tellraw @s [{"text":"[TRAP] ","color":"red"},{"text":"Trap is on cooldown!","color":"gold"}]
tag @e[tag=this_trap] remove this_trap
return fail
