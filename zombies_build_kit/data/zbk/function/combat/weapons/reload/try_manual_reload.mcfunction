function zbk:combat/weapons/events/before_manual_reload
execute if data storage zbk:events result{blocked:1b} run return 0

# Repairable barriers own grounded sneak input while the player is nearby.
execute if entity @s[nbt={OnGround:1b}] if entity @e[type=minecraft:marker,tag=barrier,distance=..2,scores={barrier_state=1..}] run return 0
execute if entity @s[nbt={OnGround:1b}] if entity @e[type=minecraft:marker,tag=barrier_w3,distance=..2,scores={bw3_state=1..}] run return 0

# Dispatch a valid manual reload for the active weapon.
execute if entity @s[team=downed] run return run function zbk:combat/weapons/guns/bo3/reload/downed
execute if score @s active_weapon matches 0 if score @s gun_1 matches 1.. if score @s is_reloading_1 matches 0 if score @s reserve_ammo_1 matches 1.. unless score @s ammo_1 >= @s max_ammo_1 run function zbk:combat/weapons/reload/reload_slot_1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 1.. if score @s is_reloading_2 matches 0 if score @s reserve_ammo_2 matches 1.. unless score @s ammo_2 >= @s max_ammo_2 run function zbk:combat/weapons/reload/reload_slot_2
execute if score @s active_weapon matches 2 if score @s gun_3 matches 1.. if score @s is_reloading_3 matches 0 if score @s reserve_ammo_3 matches 1.. unless score @s ammo_3 >= @s max_ammo_3 run function zbk:combat/weapons/reload/reload_slot_3
