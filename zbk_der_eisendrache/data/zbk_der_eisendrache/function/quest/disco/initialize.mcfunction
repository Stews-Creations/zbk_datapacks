# ===== DISCO INITIALIZE =====
# Resets the disco effects system to default state
# Called from maps/der_eisendrache/quest/initialize.mcfunction on game reset

# Reset global state
scoreboard players set #disco disco_active 0
scoreboard players set #disco disco_timer 0
scoreboard players set #disco disco_used 0

# Remove any existing disco tags
tag @e[tag=disco_active] remove disco_active

# Rebuild runtime from persistent placement markers.
execute as @e[type=item_display,tag=disco_ball] on passengers run kill @s
kill @e[type=item_display,tag=disco_ball]
kill @e[type=interaction,tag=disco_interaction]
execute as @e[type=marker,tag=de_disco_marker] at @s run function zbk_der_eisendrache:quest/disco/spawning/spawn
