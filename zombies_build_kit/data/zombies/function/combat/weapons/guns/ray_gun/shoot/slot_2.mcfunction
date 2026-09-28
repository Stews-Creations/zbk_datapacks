# Ray Gun shoot for slot 2

# Block shooting if reloading
execute if score @s is_reloading_2 matches 1 run return fail

# Trigger reload if magazine empty
execute if score @s ammo_2 matches ..0 if score @s reserve_ammo_2 matches 1.. run function zombies:combat/weapons/management/reload_slot_2
execute if score @s ammo_2 matches ..0 run return fail

playsound zombies:guns.raygun ambient @a[distance=..10] ~ ~ ~ 2 1 1
function zombies:combat/weapons/effects/particles/muzzle_smoke {x:0.3,y:-0.1,z:0.5,mode:"force"}

# Start raycast with ray_gun stats
function zombies:combat/weapons/mechanics/raycast/start with storage zombies:weapons guns.ray_gun

# Decrease ammo
scoreboard players remove @s ammo_2 1

# Set cooldown (0 ticks - no cooldown)
