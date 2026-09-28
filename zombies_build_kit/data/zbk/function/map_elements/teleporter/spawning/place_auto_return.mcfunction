# ===================================
# TELEPORTER - PLACE AUTO-RETURN MARKER
# ===================================
# Purpose: Summon auto-return destination marker at endermite position
# Called as @s = the endermite, at @s = its position
# ===================================

summon marker ~ ~ ~ {Tags:["teleporter","tp_auto_return","tp_unlinked"]}

playsound minecraft:block.note_block.pling player @a ~ ~ ~ 1 1
tellraw @a [{"text":"[Teleporter] ","color":"light_purple","bold":true},{"text":"Auto-return marker placed! Link it with the same ID as its teleporter.","color":"green"}]
