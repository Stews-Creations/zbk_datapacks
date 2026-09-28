# ===================================
# THROW GRENADE (HAND-THROWN)
# ===================================
# Purpose: Throws grenade when player drops their owned knife from key 4
# Executed as: Player who dropped an item
# Dependencies: spawn_grenade.mcfunction
# ===================================

# Spawn the grenade using shared logic
function zombies:combat/weapons/grenade/spawn_grenade

execute as @e[type=minecraft:marker,tag=grenade_marker,tag=active_grenade] if score @s grenade_id = #grenade_id_counter grenade_id run tag @s add hand_grenade

# Consume one grenade ammo
scoreboard players remove @s grenade_ammo 1

# Play throw sound
playsound zbk:grenade.throw player @a ~ ~ ~ 1 1
