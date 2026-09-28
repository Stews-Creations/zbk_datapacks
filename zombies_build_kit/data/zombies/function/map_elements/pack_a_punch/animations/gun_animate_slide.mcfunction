# Dispatched from on_tick when this marker's pap_anim reaches 6.
# Context: @s = the PaP marker, at @s. Slides the now-sideways gun into the machine over 35 ticks (1.75s).
# Targets only this machine's gun via distance=..3 from the marker.

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data merge entity @s {interpolation_duration:35}
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data modify entity @s start_interpolation set from entity @s Tick

# Per-direction "inside" translation (this marker's gun only)
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_south,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.15f,0.5f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_north,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.15f,-0.5f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_east,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.5f,1.15f,0f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_west,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.5f,1.15f,0f]

# Drop the buy-in tag — interpolation continues to the inside target regardless.
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run tag @s remove pap_gun_buyin
