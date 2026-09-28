# ===== DISCO ACTIVATE =====
# Activates the disco effects for 52 seconds
# Can only be triggered once per game
# Called when a player uses /trigger disco_start

# Check if already used this game
execute if score #disco disco_used matches 1.. run tellraw @s [{"text":"[Disco] ","color":"light_purple","bold":true},{"text":"The disco has already been activated this game!","color":"red"}]
execute if score #disco disco_used matches 1.. run return fail

# Check if already active
execute if score #disco disco_active matches 1 run tellraw @s [{"text":"[Disco] ","color":"light_purple","bold":true},{"text":"The disco is already active!","color":"yellow"}]
execute if score #disco disco_active matches 1 run return fail

# Activate disco
scoreboard players set #disco disco_active 1
scoreboard players set #disco disco_used 1
scoreboard players set #disco disco_timer 1040

# Play disco music to all players
execute as @a at @s run playsound zombies:game.disco master @a ~ ~ ~ 0.3 1

# Notify all players
tellraw @a[tag=debug] [{"text":"[Disco] ","color":"light_purple","bold":true},{"text":"Let's boogie! Disco activated for 52 seconds!","color":"aqua"}]
