# End the six-tick upward pulse, then advance remaining active pulses.
execute as @a[scores={de_ag_jump_t=1}] at @s run function zbk_der_eisendrache:anti_gravity/double_jump/finish_boost
scoreboard players remove @a[scores={de_ag_jump_t=2..}] de_ag_jump_t 1

# Process one fresh sneak press per airborne period for eligible players.
execute as @a[tag=de_ag_effects] at @s run function zbk_der_eisendrache:anti_gravity/double_jump/tick_as_player
