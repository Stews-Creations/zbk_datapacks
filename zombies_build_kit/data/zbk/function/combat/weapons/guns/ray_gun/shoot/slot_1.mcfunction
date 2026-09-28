# Ray Gun shoot for slot 1

# Block shooting if reloading
execute if score @s is_reloading_1 matches 1 run return fail

# Trigger reload if magazine empty
execute if score @s ammo_1 matches ..0 if score @s reserve_ammo_1 matches 1.. run function zbk:combat/weapons/management/reload_slot_1
execute if score @s ammo_1 matches ..0 run return fail

playsound zbk:guns.raygun ambient @a[distance=..10] ~ ~ ~ 2 1 1
function zbk:combat/weapons/effects/particles/muzzle_smoke {x:0.3,y:-0.1,z:0.5,mode:"force"}

# Start raycast with ray_gun stats
function zbk:combat/weapons/mechanics/raycast/start with storage zbk:weapons guns.ray_gun

# Decrease ammo
scoreboard players remove @s ammo_1 1

# Set cooldown (0 ticks - no cooldown)
