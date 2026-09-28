# Runs as the player who claimed the visible Tram 1 reward.
function zbk:api/combat/weapons/guns/krm262/give/main
execute if score @s active_weapon matches 0 run scoreboard players set @s tier_1 1
execute if score @s active_weapon matches 1 run scoreboard players set @s tier_2 1
execute if score @s active_weapon matches 2 run scoreboard players set @s tier_3 1
execute if score @s active_weapon matches 0 run function zbk:api/combat/weapons/guns/bo3/inventory/pack {slot:1}
execute if score @s active_weapon matches 1 run function zbk:api/combat/weapons/guns/bo3/inventory/pack {slot:2}
execute if score @s active_weapon matches 2 run function zbk:api/combat/weapons/guns/bo3/inventory/pack {slot:3}
function zbk:api/player/inventory/weapons
playsound minecraft:entity.item.pickup player @s ~ ~ ~ 1 1
tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold"},{"text":"Shoeshining 100 claimed.","color":"light_purple"}]
