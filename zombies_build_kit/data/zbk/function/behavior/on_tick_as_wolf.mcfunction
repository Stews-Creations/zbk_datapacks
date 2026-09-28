# Context: one wolf at its position inside the owning behavior loop.
# The caller owns batch setup and cleanup; this hook owns only this wolf behavior.

# Anger/targeting + speed
function zbk:behavior/ai/wolf_attributes
# Preserve per-tick fall protection while airborne; grounded mobs already have zero fall distance.
execute unless predicate zbk:behavior/grounded run data modify entity @s fall_distance set value 0f
# Hellhound fire visual (only wave dogs)
execute if entity @s[tag=wave_dog] run data modify entity @s Fire set value 200s

# Shield-owner melee is resolved before health loss by Combat.
execute if score #rs_guard_active temp matches 1 run function zbk:combat/weapons/special_equipment/rocket_shield/protection/mob_tick
execute unless score #rs_guard_active temp matches 1 if entity @s[tag=rs_melee_managed] run function zbk:combat/weapons/special_equipment/rocket_shield/protection/restore_mob
