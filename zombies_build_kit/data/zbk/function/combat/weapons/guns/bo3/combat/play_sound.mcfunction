# One combined shot/action clip. Fast variants align the action with Double Tap.
$execute unless score @s perk_doubletap matches 1.. run playsound zbk:guns.$(sound) ambient @a[distance=..20] ~ ~ ~ 1.4 1
$execute if score @s perk_doubletap matches 1.. run playsound zbk:guns.$(sound_fast) ambient @a[distance=..20] ~ ~ ~ 1.4 1
