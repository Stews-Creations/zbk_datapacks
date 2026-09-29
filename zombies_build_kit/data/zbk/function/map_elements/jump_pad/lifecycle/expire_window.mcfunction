# Context: expired start marker at its position, after all launch attempts.
# Read configured seconds as ticks, clear nearby launch eligibility, then retire the window timer.

tag @s add purchased
execute store result score @s jump_pad_cooldown run data get entity @s data.cooldown 20
execute if score @s jump_pad_cooldown matches 0 run scoreboard players set @s jump_pad_cooldown 2400
execute if entity @s[tag=purchased] run tag @a[distance=..50] remove has_launched
scoreboard players reset @s jump_pad_launch_timer
