# ===================================
# PLACE TRIP MINE
# ===================================
# Called by the trip mine using_item advancement.

advancement revoke @s only zombies:trip_mine

execute unless entity @s[nbt={SelectedItemSlot:4}] run return fail
execute unless items entity @s weapon.mainhand minecraft:slime_ball[custom_data~{special_equipment:true,trip_mine:true}] run return fail
execute unless score @s special_equipment matches 2 run return fail
execute unless score @s special_equipment_ammo matches 1.. run return fail
execute if score @s special_equipment_use_lock matches 1.. run return fail

scoreboard players set @s special_equipment_use_lock 8

# Raycast from the player's eyes and place on the looked-at ground block.
scoreboard players set #trip_mine_placed temp 0
scoreboard players set @s raycast_distance 0
execute at @s anchored eyes positioned ^ ^ ^ rotated as @s run function zombies:combat/weapons/special_equipment/trip_mine/placement/raycast

execute if score #trip_mine_placed temp matches 1 if score #global game_active matches 1.. run scoreboard players remove @s special_equipment_ammo 1
execute unless score #trip_mine_placed temp matches 1 run tellraw @s [{"text":"[Trip Mine] ","color":"gold"},{"text":"No ground block in sight","color":"red"}]

scoreboard players reset @s raycast_distance
function zombies:player/inventory/special_equipment
