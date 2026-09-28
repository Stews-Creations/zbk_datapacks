# Save the base bow for safe cancellation; never use the shared PaP pending fields.
function zbk_der_eisendrache:combat/weapons/guns/bow/management/cancel_charge
$scoreboard players set @s de_eb_slot $(slot)
$scoreboard players operation @s de_eb_tier = @s tier_$(slot)
$scoreboard players operation @s de_eb_elem = @s element_$(slot)
$scoreboard players operation @s de_eb_ammo = @s ammo_$(slot)
scoreboard players operation #buyer de_eb_owner = @s id
$scoreboard players set @s gun_$(slot) 0
$scoreboard players set @s tier_$(slot) 0
$scoreboard players set @s element_$(slot) 0
scoreboard players set #phase de_eb_state 3
scoreboard players set #clock de_eb_time 0
kill @e[tag=de_eb_orb]
function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/refresh
execute at @e[type=marker,tag=de_eb_marker,limit=1] run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.bow_upgrade master @a[distance=..10] ~ ~ ~ 1 1
item replace entity @s weapon.offhand with minecraft:air
execute if score @s gun_1 matches 1.. run scoreboard players set @s active_weapon 0
execute unless score @s gun_1 matches 1.. if score @s gun_2 matches 1.. run scoreboard players set @s active_weapon 1
execute unless score @s gun_1 matches 1.. unless score @s gun_2 matches 1.. if score @s gun_3 matches 1.. if score @s perk_mule matches 1.. run scoreboard players set @s active_weapon 2
execute at @s run function zbk:api/player/inventory/weapons
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.ritual_bow_place master @s ~ ~ ~ 1 1
