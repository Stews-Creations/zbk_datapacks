tag @s remove bo3_migrate_setup
execute if score @s gun_1 matches 1..6 run tag @s add bo3_migrate_setup
execute if score @s gun_1 matches 8..10 run tag @s add bo3_migrate_setup
execute if score @s gun_2 matches 1..6 run tag @s add bo3_migrate_setup
execute if score @s gun_2 matches 8..10 run tag @s add bo3_migrate_setup
execute if score @s gun_3 matches 1..6 run tag @s add bo3_migrate_setup
execute if score @s gun_3 matches 8..10 run tag @s add bo3_migrate_setup
execute unless entity @s[tag=bo3_migrate_setup] run return 0
data modify storage zombies:bo3 saved_inventory set value {active_weapon:0,gun_1:0,ammo_1:0,max_ammo_1:0,reserve_ammo_1:0,max_reserve_1:0,tier_1:0,element_1:0,gun_2:0,ammo_2:0,max_ammo_2:0,reserve_ammo_2:0,max_reserve_2:0,tier_2:0,element_2:0,gun_3:0,ammo_3:0,max_ammo_3:0,reserve_ammo_3:0,max_reserve_3:0,tier_3:0,element_3:0}
execute store result storage zombies:bo3 saved_inventory.active_weapon int 1 run scoreboard players get @s active_weapon
execute store result storage zombies:bo3 saved_inventory.gun_1 int 1 run scoreboard players get @s gun_1
execute store result storage zombies:bo3 saved_inventory.ammo_1 int 1 run scoreboard players get @s ammo_1
execute store result storage zombies:bo3 saved_inventory.max_ammo_1 int 1 run scoreboard players get @s max_ammo_1
execute store result storage zombies:bo3 saved_inventory.reserve_ammo_1 int 1 run scoreboard players get @s reserve_ammo_1
execute store result storage zombies:bo3 saved_inventory.max_reserve_1 int 1 run scoreboard players get @s max_reserve_1
execute store result storage zombies:bo3 saved_inventory.tier_1 int 1 run scoreboard players get @s tier_1
execute store result storage zombies:bo3 saved_inventory.element_1 int 1 run scoreboard players get @s element_1
execute store result storage zombies:bo3 saved_inventory.gun_2 int 1 run scoreboard players get @s gun_2
execute store result storage zombies:bo3 saved_inventory.ammo_2 int 1 run scoreboard players get @s ammo_2
execute store result storage zombies:bo3 saved_inventory.max_ammo_2 int 1 run scoreboard players get @s max_ammo_2
execute store result storage zombies:bo3 saved_inventory.reserve_ammo_2 int 1 run scoreboard players get @s reserve_ammo_2
execute store result storage zombies:bo3 saved_inventory.max_reserve_2 int 1 run scoreboard players get @s max_reserve_2
execute store result storage zombies:bo3 saved_inventory.tier_2 int 1 run scoreboard players get @s tier_2
execute store result storage zombies:bo3 saved_inventory.element_2 int 1 run scoreboard players get @s element_2
execute store result storage zombies:bo3 saved_inventory.gun_3 int 1 run scoreboard players get @s gun_3
execute store result storage zombies:bo3 saved_inventory.ammo_3 int 1 run scoreboard players get @s ammo_3
execute store result storage zombies:bo3 saved_inventory.max_ammo_3 int 1 run scoreboard players get @s max_ammo_3
execute store result storage zombies:bo3 saved_inventory.reserve_ammo_3 int 1 run scoreboard players get @s reserve_ammo_3
execute store result storage zombies:bo3 saved_inventory.max_reserve_3 int 1 run scoreboard players get @s max_reserve_3
execute store result storage zombies:bo3 saved_inventory.tier_3 int 1 run scoreboard players get @s tier_3
execute store result storage zombies:bo3 saved_inventory.element_3 int 1 run scoreboard players get @s element_3
