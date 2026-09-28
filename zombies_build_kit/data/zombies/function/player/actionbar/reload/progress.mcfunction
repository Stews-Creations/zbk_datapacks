# Capture the effective duration, including Speed Cola and each new shell stage.
execute unless score @s rb_prev matches 1.. run scoreboard players operation @s rb_total = #rb_timer temp
execute if score #rb_timer temp > @s rb_prev run scoreboard players operation @s rb_total = #rb_timer temp
scoreboard players set @s rb_flash 0
scoreboard players operation @s rb_step = @s rb_total
scoreboard players operation @s rb_step -= #rb_timer temp
scoreboard players operation @s rb_step *= #rb_scale temp
scoreboard players operation @s rb_step /= @s rb_total
execute if score @s rb_step matches ..-1 run scoreboard players set @s rb_step 0
execute if score @s rb_step matches 43.. run scoreboard players set @s rb_step 42
scoreboard players operation @s rb_prev = #rb_timer temp
scoreboard players operation @s rb_slot = #rb_slot temp
scoreboard players operation @s rb_ammo = #rb_ammo temp
scoreboard players operation @s rb_gun = #rb_gun temp
