# ===================================
# REFILL AMMO (LOBBY INFINITE AMMO)
# ===================================
# Refills all ammo for players in lobby (when game is not active)
# Called from combat/weapons/on_tick_as_player.mcfunction

# Ensure critical scores are initialized for HUD display
execute unless score @s active_weapon matches 0.. run scoreboard players set @s active_weapon 0
execute unless score @s ammo_1 matches 0.. run scoreboard players set @s ammo_1 0
execute unless score @s ammo_2 matches 0.. run scoreboard players set @s ammo_2 0
execute unless score @s ammo_3 matches 0.. run scoreboard players set @s ammo_3 0
execute unless score @s max_reserve_1 matches 0.. run scoreboard players set @s max_reserve_1 0
execute unless score @s max_reserve_2 matches 0.. run scoreboard players set @s max_reserve_2 0
execute unless score @s max_reserve_3 matches 0.. run scoreboard players set @s max_reserve_3 0

# Refill grenades (set to max of 4 for HUD to display all filled)
scoreboard players set @s grenade_ammo 4
scoreboard players set @s max_grenade_ammo 4

# Refill equipped special equipment without granting one to players who do not have it
execute if score @s special_equipment matches 1.. run scoreboard players operation @s special_equipment_ammo = @s max_special_equipment_ammo

# Refill magazine ammo to their max
scoreboard players operation @s ammo_1 = @s max_ammo_1
scoreboard players operation @s ammo_2 = @s max_ammo_2
scoreboard players operation @s ammo_3 = @s max_ammo_3

# Refill reserve ammo to their max
scoreboard players operation @s reserve_ammo_1 = @s max_reserve_1
scoreboard players operation @s reserve_ammo_2 = @s max_reserve_2
scoreboard players operation @s reserve_ammo_3 = @s max_reserve_3
