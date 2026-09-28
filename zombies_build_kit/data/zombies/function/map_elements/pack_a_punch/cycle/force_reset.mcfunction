# Force-reset one Pack-a-Punch marker after an interrupted or stale buy cycle.
# Context: @s = the PaP marker, at @s.

function zbk:dispatch/extension/map_elements/pack_a_punch/cycle/force_reset/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

execute as @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Purchase","color":"gold","bold":true}]
execute as @e[type=text_display,distance=..3,tag=pap_text_revert_pending,limit=1,sort=nearest] run tag @s remove pap_text_revert_pending

tag @s remove pap_busy
tag @s remove pap_claim_ready
tag @s remove pap_song_lock
tag @s remove pap_anim_active
tag @s remove pap_claim_target

scoreboard players reset #pap_buyer_temp stats
scoreboard players operation #pap_buyer_temp stats = @s pap_buyer_id
execute as @a if score @s id = #pap_buyer_temp stats run scoreboard players reset @s pap_pending_slot
execute as @a if score @s id = #pap_buyer_temp stats run scoreboard players reset @s pap_pending_tier
execute as @a if score @s id = #pap_buyer_temp stats run scoreboard players reset @s pap_pending_gun_id

scoreboard players reset @s pap_buyer_id
scoreboard players reset @s pap_anim

function zombies:map_elements/pack_a_punch/animations/gun_hide
