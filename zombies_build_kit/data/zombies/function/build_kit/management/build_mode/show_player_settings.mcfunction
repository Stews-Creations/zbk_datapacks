# ===================================
# BUILD MODE - SHOW PLAYER SETTINGS
# ===================================
# Displays all per-player toggle states to the executing player.

tellraw @s [{"text":"========= Player Settings =========","color":"gold"}]

# Disable TP
execute if entity @s[tag=disable_tp] run tellraw @s [{"text":" Disable TP: ","color":"gray"},{"text":"ON","color":"red"}]
execute unless entity @s[tag=disable_tp] run tellraw @s [{"text":" Disable TP: ","color":"gray"},{"text":"OFF","color":"green"}]

# Skip End Cutscene
execute if entity @s[tag=skip_end_cutscene] run tellraw @s [{"text":" End Cutscene: ","color":"gray"},{"text":"SKIP","color":"red"}]
execute unless entity @s[tag=skip_end_cutscene] run tellraw @s [{"text":" End Cutscene: ","color":"gray"},{"text":"PLAY","color":"green"}]

# Hide Gun
execute if score @s hide_gun matches 1.. run tellraw @s [{"text":" Gun: ","color":"gray"},{"text":"HIDDEN","color":"red"}]
execute unless score @s hide_gun matches 1.. run tellraw @s [{"text":" Gun: ","color":"gray"},{"text":"VISIBLE","color":"green"}]

# Debug Mode
execute if entity @s[tag=debug] run tellraw @s [{"text":" Debug Mode: ","color":"gray"},{"text":"ON","color":"green"},{"text":" (Level ","color":"gray"},{"score":{"name":"@s","objective":"debug_level"},"color":"yellow"},{"text":")","color":"gray"}]
execute unless entity @s[tag=debug] run tellraw @s [{"text":" Debug Mode: ","color":"gray"},{"text":"OFF","color":"red"}]

tellraw @s [{"text":"===================================","color":"gold"}]
