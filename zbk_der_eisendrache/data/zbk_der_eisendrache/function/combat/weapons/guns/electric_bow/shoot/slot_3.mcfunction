# Electric bow shot from weapon slot 3.
execute unless score @s ammo_3 matches 1.. run return fail

# Preserve the bow sound family and packed pitch while using the electric profile.
execute at @s unless score @s tier_3 matches 1.. run playsound zbk_der_eisendrache:base_bow.base_bow_fire master @a[distance=..10] ~ ~ ~ 1 1
execute at @s if score @s tier_3 matches 1.. run playsound zbk_der_eisendrache:base_bow.base_bow_fire master @a[distance=..10] ~ ~ ~ 1 1.3
# One lingering effect at the first valid impact; clear requests even on a miss.
scoreboard players operation #electric_storm_pending stats = @s bow_is_charged
scoreboard players set #electric_orb_pending stats 0
execute if score @s bow_is_charged matches 0 run scoreboard players set #electric_orb_pending stats 1
function zbk:api/combat/weapons/mechanics/raycast/start with storage zombies:weapons guns.electric_bow
scoreboard players set #electric_storm_pending stats 0
scoreboard players set #electric_orb_pending stats 0

# One ammo for quick shots; two for a full charge, with a last-arrow fallback.
scoreboard players remove @s ammo_3 1
execute if score @s bow_is_charged matches 1 run scoreboard players remove @s ammo_3 1
