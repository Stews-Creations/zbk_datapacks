# Dispatched from on_tick when this marker's pap_anim reaches 270 AND still pap_claim_ready
# (the on_tick filter handles the tag check). Context: @s = the PaP marker, at @s.
# Player forfeited the claim — revert this machine to purchase phase and clear pending state.

# Revert this machine's text
function zbk:map_elements/pack_a_punch/events/extension/cycle/claim_timeout
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute as @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Purchase","color":"gold","bold":true}]
tag @s remove pap_claim_ready

# Clear pending state for this marker's buyer (matched by id).
# Reset #pap_buyer_temp first so an unset pap_buyer_id (shouldn't happen here, but defensive)
# can't match a random player's id via a stale temp value.
scoreboard players reset #pap_buyer_temp stats
scoreboard players operation #pap_buyer_temp stats = @s pap_buyer_id
execute as @a if score @s id = #pap_buyer_temp stats run scoreboard players reset @s pap_pending_slot
execute as @a if score @s id = #pap_buyer_temp stats run scoreboard players reset @s pap_pending_tier
execute as @a if score @s id = #pap_buyer_temp stats run scoreboard players reset @s pap_pending_gun_id

# Hide this machine's gun
function zbk:map_elements/pack_a_punch/animations/gun_hide

# Reset the buy-cycle timer + dispatcher gate
scoreboard players reset @s pap_anim
tag @s remove pap_anim_active
