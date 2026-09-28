# The presence gate applies only to trap runtime; placement stays in the parent hook.
# Preserve active damage, timer expiration, and cooldown order across linked traps.

execute unless entity @e[type=marker,tag=trap_corner,limit=1] run return 0
execute as @e[type=marker,tag=trap_corner,tag=trap_active] at @s run function zbk:map_elements/traps/electric/core/tick
execute as @e[type=marker,tag=trap_corner,tag=trap_cooldown] at @s run function zbk:map_elements/traps/electric/state/cooldown
