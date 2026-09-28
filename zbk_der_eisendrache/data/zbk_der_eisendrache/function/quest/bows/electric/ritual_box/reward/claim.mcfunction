execute unless score @s de_eb_slot matches 1..3 run return 0
function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/find_slot
execute if score #target de_eb_slot matches 0 run return run tellraw @s {"text":"Free a weapon slot before collecting your electric bow.","color":"yellow"}
function zbk_der_eisendrache:combat/weapons/guns/bow/management/cancel_charge
execute if score #target de_eb_slot matches 1 run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/give/slot_1 with storage zbk:weapons guns.electric_bow
execute if score #target de_eb_slot matches 2 run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/give/slot_2 with storage zbk:weapons guns.electric_bow
execute if score #target de_eb_slot matches 3 run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/give/slot_3 with storage zbk:weapons guns.electric_bow
scoreboard players operation @s active_weapon = #target de_eb_slot
scoreboard players remove @s active_weapon 1
scoreboard players reset @s de_eb_slot
scoreboard players reset @s de_eb_tier
scoreboard players reset @s de_eb_elem
scoreboard players reset @s de_eb_ammo
scoreboard players set #phase de_eb_state 5
scoreboard players set #buyer de_eb_owner 0
function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/refresh
execute at @s run function zbk:api/player/inventory/weapons
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.bow_pickup master @s ~ ~ ~ 1 1
