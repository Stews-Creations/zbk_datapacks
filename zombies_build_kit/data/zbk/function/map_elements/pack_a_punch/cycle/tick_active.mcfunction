# The absence gate skips only active-cycle work, not idle prompt repair.
# All machines finish a milestone before the next milestone begins.

# Keep cross-machine milestones in their original order.
execute unless entity @e[type=marker,tag=pap_anim_active,limit=1] run return 0
execute as @e[type=marker,tag=pap_anim_active] run scoreboard players add @s pap_anim 1

execute as @e[type=marker,tag=pap_anim_active] if score @s pap_anim matches 1 at @s run function zbk:map_elements/pack_a_punch/animations/gun_animate_in
execute as @e[type=marker,tag=pap_anim_active] if score @s pap_anim matches 6 at @s run function zbk:map_elements/pack_a_punch/presentation/gun_slide
execute as @e[type=marker,tag=pap_anim_active] if score @s pap_anim matches 80 at @s run function zbk:map_elements/pack_a_punch/presentation/flag_down
# 120 = flag_down (80) + gun_emerge interpolation (40t). Open claim only AFTER the gun
# has visibly emerged — prevents fast-clickers from killing the gun mid-animation.
# Set the "Claim Gun" text in the same tick the busy lock lifts so the prompt and the
# clickability stay in sync.
execute as @e[type=marker,tag=pap_anim_active,scores={pap_anim=120}] at @s run function zbk:map_elements/pack_a_punch/cycle/open_claim



execute as @e[type=marker,tag=pap_anim_active] if score @s pap_anim matches 160 at @s run function zbk:map_elements/pack_a_punch/cycle/unlock_after_song
execute as @e[type=marker,tag=pap_anim_active,tag=pap_claim_ready] if score @s pap_anim matches 270 at @s run function zbk:map_elements/pack_a_punch/cycle/claim_timeout
