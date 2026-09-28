# ===================================
# PACK-A-PUNCH - BUY
# ===================================
# Purpose: Upgrade the active weapon slot. Called manually by map makers.
#   PaP I costs 5000 points, PaP II (elemental) costs 2500 points.
# ===================================

# One pending upgrade per player — pap_pending_slot/tier/gun_id are stored on the player,
# so a second buy would overwrite the first and claim would apply the wrong upgrade.
#
# Orphan-buyer recovery: if pap_pending_slot is set but no live marker has our buyer_id
# (player DC'd through their buy cycle, marker was deleted by build kit), auto-restore in
# place. After restore pap_pending_slot is unset, so the guard below falls through and
# the buy proceeds normally.
execute if score @s pap_pending_slot matches 1..3 run function zbk:map_elements/pack_a_punch/management/check_orphan_buyer

execute if score @s pap_pending_slot matches 1..3 run tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Already have a pending upgrade — claim it first","color":"red"}]
execute if score @s pap_pending_slot matches 1..3 run return fail

execute if score @s active_weapon matches 0 run return run function zbk:map_elements/pack_a_punch/upgrade/apply {slot:1}
execute if score @s active_weapon matches 1 run return run function zbk:map_elements/pack_a_punch/upgrade/apply {slot:2}
execute if score @s active_weapon matches 2 run return run function zbk:map_elements/pack_a_punch/upgrade/apply {slot:3}
