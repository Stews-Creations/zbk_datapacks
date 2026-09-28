execute if score @s gun_1 matches 1..6 run function zombies:combat/weapons/guns/bo3/migration/slot_1
execute if score @s gun_1 matches 8..10 run function zombies:combat/weapons/guns/bo3/migration/slot_1
execute if score @s gun_2 matches 1..6 run function zombies:combat/weapons/guns/bo3/migration/slot_2
execute if score @s gun_2 matches 8..10 run function zombies:combat/weapons/guns/bo3/migration/slot_2
execute if score @s gun_3 matches 1..6 run function zombies:combat/weapons/guns/bo3/migration/slot_3
execute if score @s gun_3 matches 8..10 run function zombies:combat/weapons/guns/bo3/migration/slot_3
execute if score @s pap_pending_gun_id matches 1.. run function zombies:combat/weapons/guns/bo3/migration/pending
scoreboard players set @s bo3_down 0
execute if entity @s[team=downed] run scoreboard players set @s bo3_down 1
execute unless score @s bo3_down = @s bo3_was_down run function zombies:combat/weapons/guns/bo3/input/cancel
execute unless score @s active_weapon = @s bo3_last_slot run function zombies:combat/weapons/guns/bo3/input/cancel
execute if entity @s[team=downed] unless score @s bo3_was_down matches 1 run function zombies:combat/weapons/guns/bo3/inventory/fallback
scoreboard players operation @s bo3_was_down = @s bo3_down
scoreboard players operation @s bo3_last_slot = @s active_weapon
scoreboard players set #held_gun stats 0
execute if score @s active_weapon matches 0 run scoreboard players operation #held_gun stats = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #held_gun stats = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #held_gun stats = @s gun_3
execute unless score #held_gun stats = @s bo3_last_gun run function zombies:combat/weapons/guns/bo3/input/cancel
scoreboard players operation @s bo3_last_gun = #held_gun stats
