# Dispatched from on_tick when this marker's pap_anim reaches 80 (4s after buy).
# Context: @s = the PaP marker, at @s. Drops this machine's flag and starts the claim window.

# Smooth flag return (20-tick / 1 sec) — this machine's flag only
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,limit=1,sort=nearest] run data merge entity @s {interpolation_duration:20}
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,limit=1,sort=nearest] run data modify entity @s start_interpolation set from entity @s Tick

# Per-direction "down" pose (left_rotation = identity rotated by direction, translation matches spawn pose)
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_south,limit=1,sort=nearest] run data modify entity @s transformation.left_rotation set value [0f,0f,0f,1f]
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_south,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.78f,0.625f,-0.67f]

execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_north,limit=1,sort=nearest] run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_north,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.78f,0.625f,0.67f]

execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_east,limit=1,sort=nearest] run data modify entity @s transformation.left_rotation set value [0f,0.7071068f,0f,0.7071068f]
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_east,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.67f,0.625f,-0.78f]

execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_west,limit=1,sort=nearest] run data modify entity @s transformation.left_rotation set value [0f,-0.7071068f,0f,0.7071068f]
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,tag=pack_a_punch_flag_west,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.67f,0.625f,0.78f]

# Re-emerge the gun display with the PaP'd glint (2s slide back to the purchase-text spot).
# The "Claim Gun" text is set 40t later at pap_anim=120 (see on_tick), in sync with the
# pap_busy -> pap_claim_ready swap — otherwise the text says "Claim Gun" while clicks
# are still being silently swallowed by the busy check in interact.
function zbk:map_elements/pack_a_punch/animations/gun_emerge

# Add the song lock now (buy sound runs through pap_anim=160 unlock_after_song).
# pap_busy stays on until pap_anim=120 (40t / 2s later) so the player can't claim during
# the gun-emerge interpolation — otherwise a fast click kills the gun before it visibly emerges.
# The pap_busy → pap_claim_ready swap happens in on_tick at pap_anim=120.
tag @s add pap_song_lock

# Untag this machine's flag — interpolation continues to completion regardless.
execute as @e[type=item_display,distance=..3,tag=pap_flag_animating,limit=1,sort=nearest] run tag @s remove pap_flag_animating
