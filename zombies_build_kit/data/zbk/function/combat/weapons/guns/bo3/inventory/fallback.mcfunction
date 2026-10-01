function zbk:combat/weapons/reload_audio/stop_slot {slot:4}
scoreboard players set @s gun_4 20
scoreboard players set @s tier_4 0
# Solo Quick Revive supplies temporary Death & Taxes without upgrading an owned slot.
execute if score #game_mode game_mode matches 1 if score @s perk_revive matches 1.. unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 unless score @s gun_3 matches 7 run scoreboard players set @s tier_4 1
scoreboard players set @s element_4 0
function zbk:combat/weapons/guns/bo3/registry/select_4
function zbk:combat/weapons/guns/bo3/inventory/capacity with storage zbk:bo3 profile
scoreboard players operation @s ammo_4 = @s max_ammo_4
scoreboard players operation @s reserve_ammo_4 = @s max_reserve_4
scoreboard players set @s is_reloading_4 0
scoreboard players set @s reload_timer_4 0
scoreboard players set @s bo3_delay_4 0
