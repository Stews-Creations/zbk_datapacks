scoreboard players set global fire_sale 0

# Clear any pending spawn flags (fire sale ended before they could spawn)
scoreboard players reset @e[tag=mystery_box_location,type=marker] mystery_box_pending_spawn

# Restore all mystery box text displays to normal price
execute as @e[tag=mystery_box_10,type=text_display] run data merge entity @s {text:[{"text":"Buy: 950","color":"#FFAA00","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":"minecraft:uniform"}]}

# Mark all inactive boxes as needing empty animation
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] fire_sale_cleanup: ","color":"aqua"},{"text":"Setting pending_empty on all inactive boxes","color":"gold"}]
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_active=0}] run scoreboard players set @s mystery_box_pending_empty 1

# Try to run empty immediately for boxes not currently animating (including box_close)
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_active=0,mystery_box_pending_empty=1}] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] unless entity @s[scores={mystery_box_frame=1..}] unless entity @s[tag=anim_box_close_north] unless entity @s[tag=anim_box_close_south] unless entity @s[tag=anim_box_close_east] unless entity @s[tag=anim_box_close_west] at @s run function zbk:map_elements/mystery_box/animation/triggers/empty

# Store expired slot before reset so only later powerups shift down.
scoreboard players operation #expired_powerup powerup_order = fire_sale powerup_order
scoreboard players set fire_sale powerup_order 0

# Shift down powerups that were displayed after this one.
execute if score #expired_powerup powerup_order matches 1.. if score active_powerups powerup_order matches 1.. run scoreboard players remove active_powerups powerup_order 1
execute if score #expired_powerup powerup_order matches 1.. if score double_points powerup_order > #expired_powerup powerup_order run scoreboard players remove double_points powerup_order 1
execute if score #expired_powerup powerup_order matches 1.. if score insta_kill powerup_order > #expired_powerup powerup_order run scoreboard players remove insta_kill powerup_order 1
