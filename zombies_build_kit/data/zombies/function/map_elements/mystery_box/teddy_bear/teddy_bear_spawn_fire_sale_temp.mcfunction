# === SPAWN TEMP FIRE SALE BOX AFTER TEDDY ===
# @s = mystery_box_location marker
# Spawns a fire sale box at the old teddy bear location
# This runs only if fire_sale is active when teddy bear animation completes

execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] teddy_spawn_fire_sale_temp: ","color":"aqua"},{"text":"Spawning temp box, setting ready=1","color":"green"}]

# Spawn animation at this location
# Reset frame first
execute at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] run scoreboard players set @s mystery_box_frame 0

# Play spawn animation based on direction
execute if entity @s[tag=facing_south] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_south/play_anim
execute if entity @s[tag=facing_north] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_north/play_anim
execute if entity @s[tag=facing_east] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_east/play_anim
execute if entity @s[tag=facing_west] as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] at @s run function mystery_box:a/spawn_west/play_anim

# Update text display to fire sale price
execute at @s as @e[tag=mystery_box_10,type=text_display,distance=..2,limit=1,sort=nearest] run data merge entity @s {text:[{"text":"Buy: 10","color":"#FFAA00","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":"minecraft:uniform"}]}

# Mark as ready for purchase (fire sale price)
scoreboard players set @s mystery_box_ready 1
scoreboard players set @s mystery_box_last_anim 2
