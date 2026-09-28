# === ELECTRIC TRAP COOLDOWN ===
# Runs every tick for traps on cooldown

# Decrement cooldown timer
scoreboard players remove @s trap_timer 1

# Visual indicator - subtle particles every 20 ticks (1 second)
execute if score @s trap_timer matches 0.. run particle minecraft:dust{color:[0.0,0.8,1.0],scale:1.0} ~ ~0.5 ~ 0.5 0.5 0.5 0 1 force

# When cooldown ends, make trap ready again
execute if score @s trap_timer matches ..0 run function zbk:map_elements/traps/electric/state/ready
