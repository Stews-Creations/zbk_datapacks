# === DELETE JUMP PAD ===
# Kills the interacted jump pad marker and all associated entities near it

# Kill text display near the interacted marker
execute as @e[tag=jp_dialog_interacted,limit=1] at @s run kill @e[type=text_display,tag=jump_pad_text_display,distance=..5,limit=1,sort=nearest]

# Kill interaction entity near the interacted marker
execute as @e[tag=jp_dialog_interacted,limit=1] at @s run kill @e[type=interaction,tag=jump_pad_interaction,distance=..5,limit=1,sort=nearest]

# Clean up dialog tags from other entities
tag @e[tag=jp_dialog_target] remove jp_dialog_target

# Kill the interacted jump pad marker
kill @e[tag=jp_dialog_interacted,limit=1]

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Jump pad deleted.","color":"red"}]
