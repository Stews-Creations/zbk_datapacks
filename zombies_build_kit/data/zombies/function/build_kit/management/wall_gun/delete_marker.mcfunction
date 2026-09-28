# === DELETE WALL GUN ===
# Kills the nearest wall gun marker and all associated entities
# (interaction, text display, item display)

# Kill text display
kill @e[type=text_display,tag=wall_gun_ui,distance=..5,limit=1,sort=nearest]

# Kill item display
kill @e[type=item_display,tag=wall_gun_ui,distance=..5,limit=1,sort=nearest]

# Kill interaction
kill @e[type=interaction,tag=wall_gun_interaction,distance=..5,limit=1,sort=nearest]

# Kill the main wall gun marker
kill @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest]

# Debug-only setup confirmation
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s[tag=debug] [{"text":"[Build Kit] ","color":"gold"},{"text":"Wall gun deleted.","color":"red"}]
