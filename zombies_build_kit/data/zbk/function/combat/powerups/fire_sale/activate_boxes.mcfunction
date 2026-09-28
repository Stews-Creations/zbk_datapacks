# === FIRE SALE BOX SPAWNING ===
# Safe to call on both fresh activation and re-activation
# Only marks boxes that aren't already showing (ready=0)

# Mark inactive boxes that aren't already ready (empty boxes only)
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_active=0}] unless score @s mystery_box_ready matches 1 run scoreboard players set @s mystery_box_pending_spawn 1

# Try to spawn immediately for boxes not currently animating
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_pending_spawn=1}] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] unless score @s mystery_box_frame matches 1.. at @s as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zbk:map_elements/mystery_box/animation/triggers/spawn_from_pending

# Update all mystery box text displays to show fire sale price
execute as @e[tag=mystery_box_10,type=text_display] run data merge entity @s {text:[{"text":"Buy: 10","color":"#FFAA00","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":"minecraft:uniform"}]}
