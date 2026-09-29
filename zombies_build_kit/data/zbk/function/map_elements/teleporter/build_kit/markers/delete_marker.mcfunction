# === DELETE TELEPORTER ===
# Kills the interacted teleporter marker and all associated entities near it

# Kill text display near the interacted marker
execute if entity @e[tag=tp_dialog_interacted,tag=tp_start,limit=1] as @e[tag=tp_dialog_interacted,limit=1] at @s run kill @e[type=text_display,tag=teleporter_text_display,distance=..5,limit=1,sort=nearest]
execute if entity @e[tag=tp_dialog_interacted,tag=tp_end,limit=1] as @e[tag=tp_dialog_interacted,limit=1] at @s run kill @e[type=text_display,tag=teleporter_end_text_display,distance=..5,limit=1,sort=nearest]

# Kill interaction entity near the interacted marker
execute as @e[tag=tp_dialog_interacted,limit=1] at @s run kill @e[type=interaction,tag=teleporter_interaction,distance=..5,limit=1,sort=nearest]

# Clean up dialog tags from other entities
tag @e[tag=tp_dialog_target] remove tp_dialog_target

# Kill the interacted teleporter marker
kill @e[tag=tp_dialog_interacted,limit=1]

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Teleporter deleted.","color":"red"}]
