# === DELETE PACK-A-PUNCH ENTITIES ===
# Called as/at the pack_a_punch marker. Restores any in-flight buyer's slot,
# places the empty template (centered, 3 wide), kills all associated display
# entities (including the in-flight gun display), then kills the marker itself.

# Restore in-flight buyer: lose_gun already zeroed their slot and took their points,
# so restoring the gun id is the kinder option (points stay spent, matching claim_timeout).
#
# Reset #pap_buyer_temp first — `scoreboard players operation` against an unset source
# is a no-op and leaves the target at its previous value. If this marker was never bought
# from (pap_buyer_id unset), a stale temp value could match an unrelated player's id and
# fire inventory/weapons on them. Reset + operation = unset-if-unset, so the @a id-match
# below cleanly no-ops. All three reset lines are gated for consistency (S3).
scoreboard players reset #pap_buyer_temp stats
scoreboard players operation #pap_buyer_temp stats = @s pap_buyer_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 1 run scoreboard players operation @s gun_1 = @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 2 run scoreboard players operation @s gun_2 = @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 3 run scoreboard players operation @s gun_3 = @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 1..3 run scoreboard players reset @s pap_pending_slot
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_tier matches 1..2 run scoreboard players reset @s pap_pending_tier
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_gun_id matches 1.. run scoreboard players reset @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 1..3 run function zombies:player/inventory/weapons

# === PLACE EMPTY STRUCTURE (centered on marker, rotated to match direction) ===
execute if entity @s[tag=pack_a_punch_south] run place template zombies:pack_a_punch_empty ~-1 ~ ~ none
execute if entity @s[tag=pack_a_punch_west] run place template zombies:pack_a_punch_empty ~ ~ ~-1 clockwise_90
execute if entity @s[tag=pack_a_punch_north] run place template zombies:pack_a_punch_empty ~1 ~ ~ 180
execute if entity @s[tag=pack_a_punch_east] run place template zombies:pack_a_punch_empty ~ ~ ~1 counterclockwise_90

# Kill this machine's displays only — one per unique sub-tag, nearest wins.
# pack_a_punch_gun_display only exists during a buy cycle; missing it would orphan
# the gun item floating in air when a machine is deleted mid-buy.
kill @e[type=item_display,distance=..3,tag=pack_a_punch_core,limit=1,sort=nearest]
kill @e[type=item_display,distance=..3,tag=pack_a_punch_flag,limit=1,sort=nearest]
kill @e[type=item_display,distance=..3,tag=pack_a_punch_rotaters,limit=1,sort=nearest]
kill @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest]
kill @e[type=text_display,distance=..3,tag=pack_a_punch_title,limit=1,sort=nearest]
kill @e[type=text_display,distance=..3,tag=pack_a_punch_raygun,limit=1,sort=nearest]
kill @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest]
kill @e[type=interaction,distance=..3,tag=pack_a_punch_interaction,limit=6,sort=nearest]

# Kill self (marker)
kill @s
