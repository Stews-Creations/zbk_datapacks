# ===================================
# THROW GRENADE (HAND-THROWN)
# ===================================
# Purpose: Throws grenade when player drops their owned knife from key 4
# Executed as: Player who dropped an item
# Dependencies: spawn_grenade.mcfunction
# ===================================

# Downed players cannot throw hand grenades in solo or co-op.
execute if entity @s[team=downed] run return 0

execute unless score @s grenade_ammo matches 1.. run return 0

# Spawn the grenade using shared logic
function zbk:combat/weapons/grenade/spawning/spawn_grenade

execute as @e[type=minecraft:marker,tag=grenade_marker,tag=active_grenade] if score @s grenade_id = #grenade_id_counter grenade_id run tag @s add hand_grenade

execute if score @s perk_widows matches 1.. as @e[type=marker,tag=grenade_marker,tag=active_grenade] if score @s grenade_id = #grenade_id_counter grenade_id run function zbk:map_elements/perks/widows_wine/grenade/configure

# Consume one grenade ammo
scoreboard players remove @s grenade_ammo 1

# Play throw sound
playsound zbk:grenade.throw player @a ~ ~ ~ 1 1
