# Run after F-key detection and before inventory reconstruction.
# clear's count query includes moved items and the carried cursor stack.
execute store result score #inventory_knives temp run clear @s *[custom_data~{knife:true}] 0
execute if score #inventory_knives temp matches 2.. run clear @s *[custom_data~{knife:true}]
execute unless items entity @s hotbar.3 *[custom_data~{knife:true}] run clear @s *[custom_data~{knife:true}]
scoreboard players set #inventory_knife_owner temp -1
execute store result score #inventory_knife_owner temp run data get entity @s Inventory[{Slot:3b}].components."minecraft:custom_data".player_id
execute unless score #inventory_knife_owner temp = @s id run clear @s *[custom_data~{knife:true}]
execute store result score #inventory_guns temp run clear @s *[custom_data~{gun:true}] 0
execute if score #inventory_guns temp matches 2.. run clear @s *[custom_data~{gun:true}]
execute unless items entity @s weapon.offhand *[custom_data~{gun:true}] run clear @s *[custom_data~{gun:true}]
# Shield restoration remains owned by Combat; only discard additional copies here.
execute store result score #inventory_shields temp run clear @s *[custom_data~{rocket_shield_prototype:true}] 0
execute if score @s rs_owned matches 1 if score #inventory_shields temp matches 2.. run clear @s *[custom_data~{rocket_shield_prototype:true}]
execute unless score @s rs_owned matches 1 run clear @s *[custom_data~{rocket_shield_prototype:true}]
