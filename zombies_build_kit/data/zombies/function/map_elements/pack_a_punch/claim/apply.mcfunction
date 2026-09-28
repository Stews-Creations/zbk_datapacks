# Pack-a-Punch claim — apply step (macro).
# Called as @s = the claiming player. Caller passes {slot: 1|2|3} via a function macro arg.
# Restores the buy-time gun, applies the pending tier, refreshes inventory, and (for PaP II)
# assigns a fresh element.

# Restore the gun id from the buy-time snapshot
$execute if score @s pap_pending_tier matches 1.. run scoreboard players operation @s gun_$(slot) = @s pap_pending_gun_id

# Ray Gun cannot receive PaP II or elemental effects, even from stale pending state.
$execute if score @s pap_pending_gun_id matches 7 if score @s pap_pending_tier matches 1.. run scoreboard players set @s tier_$(slot) 1
$execute if score @s pap_pending_gun_id matches 7 if score @s pap_pending_tier matches 1.. run scoreboard players set @s element_$(slot) 0
execute if score @s pap_pending_gun_id matches 7 if score @s pap_pending_tier matches 1.. run function zombies:player/inventory/weapons
execute if score @s pap_pending_gun_id matches 7 run return 0

# PaP I claim: tier 0 -> 1
$execute if score @s pap_pending_tier matches 1 run scoreboard players set @s tier_$(slot) 1
execute if score @s pap_pending_tier matches 1 run function zombies:player/inventory/weapons

# PaP II claim: tier 1 -> 2 + assign element (re-roll if already elemental, never duplicate)
$execute if score @s pap_pending_tier matches 2 run function zombies:map_elements/pack_a_punch/assign_element/roll {slot:$(slot)}
$execute if score @s pap_pending_tier matches 2 run scoreboard players set @s tier_$(slot) 2
execute if score @s pap_pending_tier matches 2 run function zombies:player/inventory/weapons

# BO3 integration
$execute if score @s gun_$(slot) matches 20..46 run function zombies:combat/weapons/guns/bo3/inventory/pack {slot:$(slot)}
function zombies:player/inventory/weapons
