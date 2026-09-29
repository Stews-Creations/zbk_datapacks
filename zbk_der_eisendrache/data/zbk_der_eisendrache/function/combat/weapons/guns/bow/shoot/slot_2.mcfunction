# Bow shoot for slot 2

# Block shooting if no ammo
execute if score @s ammo_2 matches ..0 run return fail

# Sound and particle effects
execute at @s unless score @s tier_2 matches 1.. run playsound zbk_der_eisendrache:base_bow.base_bow_fire master @a[distance=..10] ~ ~ ~ 1 1
execute at @s if score @s tier_2 matches 1.. run playsound zbk_der_eisendrache:base_bow.base_bow_fire master @a[distance=..10] ~ ~ ~ 1 1.3
execute anchored eyes run particle minecraft:crit ^0.25 ^-0.1 ^0.5 0 0 0 0 1 force

# Start raycast with bow stats (quick or charged)
execute if score @s bow_is_charged matches 0 run function zbk:combat/weapons/mechanics/raycast/start with storage zbk:weapons guns.bow
execute if score @s bow_is_charged matches 1 run function zbk:combat/weapons/mechanics/raycast/start with storage zbk:weapons guns.bow_charged

# Decrease ammo (1 for quick shot, 2 for charged shot)
scoreboard players remove @s ammo_2 1
execute if score @s bow_is_charged matches 1 run scoreboard players remove @s ammo_2 1
