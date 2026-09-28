# === ELECTRIC TRAP TICK ===
# Runs every tick for each active trap corner
# Finds the other active corner nearby and damages entities between them

# Decrement timer
scoreboard players remove @s trap_timer 1

# Find the other active corner nearby (within 50 blocks)
tag @e[type=marker,tag=trap_corner,tag=trap_active,distance=0.1..50,limit=1,sort=nearest] add temp_partner

# Run effects if we found a partner (only from corner1 to avoid duplicate particles)
execute if entity @s[tag=trap_corner1] if entity @e[type=marker,tag=temp_partner,limit=1] run function zombies:map_elements/traps/electric/damage/apply

# Cleanup temp tag
tag @e[tag=temp_partner] remove temp_partner

# When timer reaches 0, deactivate
execute if score @s trap_timer matches ..0 run function zombies:map_elements/traps/electric/state/deactivate
