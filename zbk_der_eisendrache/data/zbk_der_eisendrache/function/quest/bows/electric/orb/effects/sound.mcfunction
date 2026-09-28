# One synchronous orb pass; preserve its position while selecting listeners.
data modify storage zombies:de_orb_sound listeners set from entity @s data.sound_listeners
execute as @a[distance=..3] run function zbk_der_eisendrache:quest/bows/electric/orb/effects/sound_listener
data modify entity @s data.sound_listeners set from storage zombies:de_orb_sound listeners
data remove storage zombies:de_orb_sound listeners
data remove storage zombies:de_orb_sound listener
