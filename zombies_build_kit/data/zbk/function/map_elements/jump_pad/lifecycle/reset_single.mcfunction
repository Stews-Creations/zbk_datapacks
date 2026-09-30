# ===================================
# JUMP PAD - RESET SINGLE
# ===================================
# Purpose: Reset a single jump pad after cooldown expires
# Executed as the jump pad start marker
# ===================================

# Remove purchased tag
tag @s remove purchased

# Reset cooldown timer
scoreboard players reset @s jump_pad_cooldown

# Show the text display again with dynamic price from marker data
scoreboard players set $jump_pad_temp jump_pad_price 0
execute store result score $jump_pad_temp jump_pad_price run data get entity @s data.name 1
execute as @e[type=text_display,tag=jump_pad_text_display,distance=..2,limit=1] run data modify entity @s text set value [{"text":"Jump Pad\n","color":"aqua","bold":true},{"score":{"name":"$jump_pad_temp","objective":"jump_pad_price"},"color":"yellow","bold":true}]

# Visual/audio feedback
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 10 force

# Debug message
execute as @a[tag=debug,scores={debug_level=4..},distance=..20] run tellraw @s [{"text":"[Jump Pad] ","color":"gold"},{"text":"Cooldown complete - jump pad ready!","color":"green"}]
