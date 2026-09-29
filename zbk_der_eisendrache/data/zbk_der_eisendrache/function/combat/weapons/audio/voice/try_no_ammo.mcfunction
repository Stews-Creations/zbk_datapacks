# Trigger no-ammo callout when player tries to shoot with no ammo
# Called from each gun's fire.mcfunction — only plays when BOTH clip and reserve are empty
# TODO FIX
execute if score @s is_reloading_1 matches 0 if score @s active_weapon matches 0 if score @s ammo_1 matches 0 if score @s reserve_ammo_1 matches 0 run function zbk_der_eisendrache:combat/weapons/audio/voice/trigger/no_ammo
execute if score @s is_reloading_2 matches 0 if score @s active_weapon matches 1 if score @s ammo_2 matches 0 if score @s reserve_ammo_2 matches 0 run function zbk_der_eisendrache:combat/weapons/audio/voice/trigger/no_ammo
execute if score @s is_reloading_3 matches 0 if score @s active_weapon matches 2 if score @s ammo_3 matches 0 if score @s reserve_ammo_3 matches 0 run function zbk_der_eisendrache:combat/weapons/audio/voice/trigger/no_ammo
