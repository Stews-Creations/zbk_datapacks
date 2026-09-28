# Called as the location marker after its own root finishes closing.
scoreboard players set @s mystery_box_last_anim 3
scoreboard players set @s mystery_box_ready 0
execute if score @s mystery_box_active matches 1 run scoreboard players set @s mystery_box_ready 1
execute if score global fire_sale matches 1 run scoreboard players set @s mystery_box_ready 1
scoreboard players reset @s mystery_box_pending_empty
scoreboard players reset @s mystery_box_pending_spawn
# Defer empty transforms until the closing interpolation has finished.
execute unless score global fire_sale matches 1 unless score @s mystery_box_active matches 1 run scoreboard players set @s mystery_box_pending_empty 1
