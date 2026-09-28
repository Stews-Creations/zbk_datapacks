# Electric bow duplicate-release guard, decremented each tick via advancement.
# Shared bow charging/release detection controls when a shot is requested.

# Decrement trigger lock if set
execute if score @s electric_bow_trigger_lock matches 1.. run scoreboard players remove @s electric_bow_trigger_lock 1

# Revoke cooldown advancement
advancement revoke @s only zbk_der_eisendrache:electric_bow_cooldown
