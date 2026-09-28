# Context: one piglin at its position inside the owning behavior loop.
# Shared targeting may read a batch hint, but all entity writes still apply to this piglin.

# Anger/targeting + speed
function zombies:behavior/ai/piglin_attributes
# Preserve per-tick fall protection while airborne; grounded mobs already have zero fall distance.
execute unless predicate zombies:behavior/grounded run data modify entity @s fall_distance set value 0f

# Shield-owner melee is resolved before health loss by Combat.
execute if score #rs_guard_active temp matches 1 run function zombies:combat/weapons/special_equipment/rocket_shield/protection/mob_tick
execute unless score #rs_guard_active temp matches 1 if entity @s[tag=rs_melee_managed] run function zombies:combat/weapons/special_equipment/rocket_shield/protection/restore_mob
