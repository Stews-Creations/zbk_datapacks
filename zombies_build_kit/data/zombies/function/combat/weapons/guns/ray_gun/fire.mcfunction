# Ray Gun - Semi-auto weapon (fires only when ray_gun_trigger_lock is NOT set)

# Revoke both advancements immediately to prevent race condition
advancement revoke @s only zombies:ray_gun
advancement revoke @s only zombies:ray_gun_cooldown

# Slot 1 - Check trigger lock, then fire
execute if entity @s[team=downed,scores={gun_1=7}] unless score @s ray_gun_trigger_lock matches 1.. unless score @s cooldown_1 matches 1.. if score @s ammo_1 matches 1.. run function zombies:combat/weapons/guns/ray_gun/shoot/slot_1
execute if entity @s[team=downed] unless score @s gun_1 matches 7 if score @s gun_2 matches 7 unless score @s ray_gun_trigger_lock matches 1.. unless score @s cooldown_2 matches 1.. if score @s ammo_2 matches 1.. run function zombies:combat/weapons/guns/ray_gun/shoot/slot_2
execute if entity @s[team=downed] unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 if score @s gun_3 matches 7 unless score @s ray_gun_trigger_lock matches 1.. unless score @s cooldown_3 matches 1.. if score @s ammo_3 matches 1.. run function zombies:combat/weapons/guns/ray_gun/shoot/slot_3
execute unless entity @s[team=downed] if score @s active_weapon matches 0 unless score @s ray_gun_trigger_lock matches 1.. unless score @s cooldown_1 matches 1.. if score @s ammo_1 matches 1.. run function zombies:combat/weapons/guns/ray_gun/shoot/slot_1

# Slot 2 - Check trigger lock, then fire
execute unless entity @s[team=downed] if score @s active_weapon matches 1 unless score @s ray_gun_trigger_lock matches 1.. unless score @s cooldown_2 matches 1.. if score @s ammo_2 matches 1.. run function zombies:combat/weapons/guns/ray_gun/shoot/slot_2

# Slot 3 - Check trigger lock, then fire
execute unless entity @s[team=downed] if score @s active_weapon matches 2 unless score @s ray_gun_trigger_lock matches 1.. unless score @s cooldown_3 matches 1.. if score @s ammo_3 matches 1.. run function zombies:combat/weapons/guns/ray_gun/shoot/slot_3

# Set trigger lock to prevent firing until release
scoreboard players set @s ray_gun_trigger_lock 2

# No-ammo voice callout (only triggers when both clip and reserve are empty)

function zbk:dispatch/voice_try_no_ammo
