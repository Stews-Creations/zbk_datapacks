# Initializes a newly summoned Panzer electric projectile.
# Runs as: panzer_electric_projectile_new, using the thrower's execution position and rotation.

tp @s ~ ~ ~ ~ ~
scoreboard players set @s panzer_electric_lifetime 50
tag @s remove panzer_electric_projectile_new
