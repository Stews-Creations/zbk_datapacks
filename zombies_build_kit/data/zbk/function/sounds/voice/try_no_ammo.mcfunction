# Check the active weapon when the voice_try_no_ammo event is dispatched.
execute if score @s is_reloading_1 matches 0 if score @s active_weapon matches 0 if score @s ammo_1 matches 0 if score @s reserve_ammo_1 matches 0 run function zbk:sounds/voice/event_no_ammo
execute if score @s is_reloading_2 matches 0 if score @s active_weapon matches 1 if score @s ammo_2 matches 0 if score @s reserve_ammo_2 matches 0 run function zbk:sounds/voice/event_no_ammo
execute if score @s is_reloading_3 matches 0 if score @s active_weapon matches 2 if score @s ammo_3 matches 0 if score @s reserve_ammo_3 matches 0 run function zbk:sounds/voice/event_no_ammo
