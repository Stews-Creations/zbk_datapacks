# Landing refreshes the single available air jump.
execute if entity @s[nbt={OnGround:1b}] run tag @s add de_ag_air_jump_ready

# A fresh sneak press while airborne consumes the ready air jump.
execute if predicate zbk:is_sneaking unless entity @s[tag=de_ag_sneak_held] unless entity @s[nbt={OnGround:1b}] if entity @s[tag=de_ag_air_jump_ready] run function zbk_der_eisendrache:anti_gravity/double_jump/boost

# Track the press edge so holding sneak cannot retrigger the jump.
execute if predicate zbk:is_sneaking run tag @s add de_ag_sneak_held
execute unless predicate zbk:is_sneaking run tag @s remove de_ag_sneak_held
