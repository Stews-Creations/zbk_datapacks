# Per-player orphan-buyer recovery — @s = the player.
#
# Called from buy.mcfunction when pap_pending_slot is 1..3. If no live in-progress marker
# has pap_buyer_id == player.id, the player got disconnected through their own buy cycle
# (or the marker was deleted by the build kit) and the cleanup ran without them. Without
# this check, the player stays locked out of every PaP machine until the next /reload.
#
# Restores the snapshotted gun in-place and clears pending state. Points are kept spent
# (matches claim_timeout semantics — you forfeited the upgrade, not your money).

scoreboard players operation #pap_orphan_id stats = @s id
scoreboard players set #pap_has_live stats 0
execute as @e[type=marker,tag=pap_anim_active] if score @s pap_buyer_id = #pap_orphan_id stats run scoreboard players set #pap_has_live stats 1
execute if score #pap_has_live stats matches 1.. run return 0

# No live marker — restore pending state in place
execute if score @s pap_pending_slot matches 1 run scoreboard players operation @s gun_1 = @s pap_pending_gun_id
execute if score @s pap_pending_slot matches 2 run scoreboard players operation @s gun_2 = @s pap_pending_gun_id
execute if score @s pap_pending_slot matches 3 run scoreboard players operation @s gun_3 = @s pap_pending_gun_id
scoreboard players reset @s pap_pending_slot
scoreboard players reset @s pap_pending_tier
scoreboard players reset @s pap_pending_gun_id
function zbk:player/inventory/weapons
tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Restored your pending weapon — the machine timed out without you.","color":"yellow"}]
