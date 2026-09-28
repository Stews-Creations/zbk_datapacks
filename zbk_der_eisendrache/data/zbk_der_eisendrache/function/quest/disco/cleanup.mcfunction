# ===== DISCO CLEANUP =====
# Stops disco effects after timer expires
# Called from on_tick.mcfunction when timer reaches 1

# Reset active state
scoreboard players set #disco disco_active 0

# Clear timer
scoreboard players set #disco disco_timer 0

# Remove tags
tag @e[tag=disco_active] remove disco_active

# Notify players
tellraw @a[tag=debug] [{"text":"[Disco] ","color":"light_purple","bold":true},{"text":"Disco time is over!","color":"gray"}]
playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.5
