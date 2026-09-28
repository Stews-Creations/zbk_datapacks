# Dispatched from on_tick when this marker's pap_anim reaches 1.
# Context: @s = the PaP marker, at @s. Phase 1 of entry: rotate sideways over 5 ticks (0.25s).
# Targets only this machine's gun via distance=..3 from the marker.

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data merge entity @s {interpolation_duration:5}
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data modify entity @s start_interpolation set from entity @s Tick

# Rotate 90 deg around Y via right_rotation — makes the gun barrel point sideways.
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run data modify entity @s transformation.right_rotation set value [0f,0.7071068f,0f,0.7071068f]
