# === DELETE WUNDERFIZZ ENTITIES ===
# Called as/at the wunderfizz marker. Places empty template to clear blocks,
# then kills all associated entities and the marker.

# Place wunderfizz_empty template with correct orientation
execute if score @s playerYaw matches -45..45 run place template minecraft:zombies/wunderfizz_empty ~-1 ~-2 ~ counterclockwise_90
execute if score @s playerYaw matches 45..135 run place template minecraft:zombies/wunderfizz_empty ~ ~-2 ~-1 none
execute if score @s playerYaw matches 135..180 run place template minecraft:zombies/wunderfizz_empty ~1 ~-2 ~ clockwise_90
execute if score @s playerYaw matches -180..-135 run place template minecraft:zombies/wunderfizz_empty ~1 ~-2 ~ clockwise_90
execute if score @s playerYaw matches -135..-45 run place template minecraft:zombies/wunderfizz_empty ~ ~-2 ~1 180

# Kill text displays
kill @e[type=text_display,tag=wunderfizz_text_display,distance=..5]
kill @e[type=text_display,tag=wunderfizz_perk_name,distance=..5]

# Kill interaction entity
kill @e[type=interaction,tag=wunderfizz_interaction,distance=..5]

# Kill item display (perk preview)
kill @e[type=item_display,tag=wunderfizz_display,distance=..5]

# Kill nearby perk bonus marker
kill @e[type=marker,tag=perk_bonus,distance=..5]

# Kill self (marker)
kill @s
