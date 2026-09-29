# ===================================
# PACK-A-PUNCH - BUY ANIMATION DISPATCHER
# ===================================
# Called from each slot_X.mcfunction successful purchase branch.
# Context: @s = the buying player, at their position.
# Add new buy animations as additional dispatch lines below.
# ===================================

# Flag tilt: snap straight up on the nearest machine's flag
execute as @e[type=item_display,distance=..5,tag=pack_a_punch_flag,limit=1,sort=nearest] run function zbk:map_elements/pack_a_punch/animations/flag_up

# Clear purchase prompt text on buy (will become "Claim Gun" when the flag returns 4s later)
execute as @e[type=text_display,distance=..5,tag=pack_a_punch_purchase_text,limit=1,sort=nearest] run data modify entity @s text set value [{"text":""}]

# Mark machine busy for the 4s flag-up phase (clicks ignored until flag_down fires)
tag @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] add pap_busy

# Lock machine to this buyer — record their id so only they can claim
scoreboard players operation #pap_buyer_temp stats = @s id
execute as @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] run scoreboard players operation @s pap_buyer_id = #pap_buyer_temp stats

# Start the per-marker animation tick counter — on_tick advances it and fires each phase.
# pap_anim_active gates the on_tick dispatcher so inactive machines skip animation work after the presence check.
execute as @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] run scoreboard players set @s pap_anim 0
execute as @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] run tag @s add pap_anim_active

# Spawn the animated gun display. lose_gun (called earlier in the buy step) snapshotted
# the original gun id to @s pap_pending_gun_id — copy it to the scratch fake-player score
# that gun_spawn reads when picking the item_model.
scoreboard players operation #pap_gun_id stats = @s pap_pending_gun_id
execute as @e[type=marker,distance=..5,tag=pack_a_punch,limit=1,sort=nearest] at @s run function zbk:map_elements/pack_a_punch/presentation/gun_spawn
