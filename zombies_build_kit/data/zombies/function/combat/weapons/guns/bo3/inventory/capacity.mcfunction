# Apply selected tier's capacities without manufacturing ammunition during migration.
$scoreboard players set @s max_ammo_$(slot) $(max_ammo)
$scoreboard players set @s max_reserve_$(slot) $(max_reserve)
$execute if score @s ammo_$(slot) > @s max_ammo_$(slot) run scoreboard players operation @s ammo_$(slot) = @s max_ammo_$(slot)
$execute if score @s reserve_ammo_$(slot) > @s max_reserve_$(slot) run scoreboard players operation @s reserve_ammo_$(slot) = @s max_reserve_$(slot)
$execute if score @s ammo_$(slot) matches ..-1 run scoreboard players set @s ammo_$(slot) 0
$execute if score @s reserve_ammo_$(slot) matches ..-1 run scoreboard players set @s reserve_ammo_$(slot) 0
