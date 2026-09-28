# Runs as and at: panzer_ai iron golem.

# A captured Panzer cannot relocate, tick an attack window, or start an attack.
execute if entity @s[tag=zbk.enemy_stunned] run return 0

execute if entity @s[tag=panzer_landing_descent] run function zombies:bosses/panzer/model/landing/descent_tick
execute if entity @s[tag=panzer_landing_descent] run return 0

function zombies:bosses/panzer/ai/attributes

# Prevent fall damage on terrain and attack knockback weirdness.
data modify entity @s fall_distance set value 0f

function zombies:bosses/panzer/controller/relocation_check

function zombies:bosses/panzer/attacks/controller/on_tick
