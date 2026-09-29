# Purchase Gun ID 16 as a slot-zero melee upgrade rather than a gun-slot weapon.
execute if score @s bowie_knife matches 1.. run tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"red"},{"text":"Bowie Knife already purchased.","color":"gold"}]
execute if score @s bowie_knife matches 1.. run return fail

execute store result score #wall_gun_cost temp run data get entity @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] data.price
execute unless score @s player_points >= #wall_gun_cost temp run tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"red"},{"text":"Not enough points! Need ","color":"gold"},{"score":{"name":"#wall_gun_cost","objective":"temp"},"color":"yellow"},{"text":" points.","color":"gold"}]
execute unless score @s player_points >= #wall_gun_cost temp run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute unless score @s player_points >= #wall_gun_cost temp run return fail

scoreboard players operation @s player_points -= #wall_gun_cost temp
scoreboard players set @s bowie_knife 1
function zbk:player/inventory/melee/give_bowie_knife_wrapper
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.5
function zbk:map_elements/wall_gun/events/voice_event_wall_buy
tellraw @s[tag=debug] [{"text":"[WALL GUN] ","color":"green"},{"text":"Purchased Bowie Knife.","color":"gold"}]
