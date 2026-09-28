# PaP Claim - apply pending upgrade and reset machine to purchase phase.
# Context: @s = player who just right-clicked a claim-ready machine.

# Pick the claim-ready machine owned by this player. Using an explicit target tag avoids
# a nearby claim-ready machine owned by someone else stealing the nearest-marker check.
scoreboard players operation #pap_buyer_temp stats = @s id
tag @e[type=marker,tag=pap_claim_target] remove pap_claim_target
execute as @e[type=marker,distance=..5,tag=pack_a_punch,tag=pap_claim_ready] if score @s pap_buyer_id = #pap_buyer_temp stats run tag @s add pap_claim_target
execute unless entity @e[type=marker,distance=..5,tag=pap_claim_target,limit=1] run return 0

# Player must have a pending upgrade. If the machine is claim-ready but the pending state
# is already gone, clean the stale prompt instead of leaving "Claim Gun" forever.
execute unless score @s pap_pending_slot matches 1..3 as @e[type=marker,distance=..5,tag=pap_claim_target,limit=1,sort=nearest] at @s run function zbk:map_elements/pack_a_punch/cycle/force_reset
execute unless score @s pap_pending_slot matches 1..3 run tag @e[type=marker,tag=pap_claim_target] remove pap_claim_target
execute unless score @s pap_pending_slot matches 1..3 run return 0

# Per-machine reset runs at the verified claim-ready marker so all text/gun operations
# stay machine-local.
execute as @e[type=marker,distance=..5,tag=pap_claim_target,limit=1,sort=nearest] at @s run function zbk:map_elements/pack_a_punch/claim/reset_machine
tag @e[type=marker,tag=pap_claim_target] remove pap_claim_target

# Set active_weapon to the just-claimed slot so the player auto-holds the PaP'd gun
# (idempotent when this was the player's only gun; effective when they had another).
# active_weapon is 0-indexed: pap_pending_slot - 1.
scoreboard players operation @s active_weapon = @s pap_pending_slot
scoreboard players remove @s active_weapon 1

# Apply the upgrade - claim/apply is a macro that handles all three slots.
execute if score @s pap_pending_slot matches 1 run function zbk:map_elements/pack_a_punch/claim/apply {slot:1}
execute if score @s pap_pending_slot matches 2 run function zbk:map_elements/pack_a_punch/claim/apply {slot:2}
execute if score @s pap_pending_slot matches 3 run function zbk:map_elements/pack_a_punch/claim/apply {slot:3}

# Clear pending state.
scoreboard players reset @s pap_pending_slot
scoreboard players reset @s pap_pending_tier
scoreboard players reset @s pap_pending_gun_id

# Delay the "Purchase" text revert by 10 ticks (~0.5s) so it shows up after the equip
# cooldown clears. If the song lock is still on, unlock_after_song will revert it instead.
schedule function zbk:map_elements/pack_a_punch/cycle/revert_purchase_text 10t replace

return 1
