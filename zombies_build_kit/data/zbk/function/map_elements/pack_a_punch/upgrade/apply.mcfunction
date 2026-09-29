# Pack-a-Punch upgrade — buy step (macro).
# Called as @s = the buying player. Caller must pass {slot: 1|2|3} via a function macro arg.
# Deducts points and remembers the pending upgrade on the player. The animation, tier bump,
# inventory refresh, and element assignment happen during claim (4s+ later).
#
# Pattern: check affordability + early-return on failure, THEN deduct, THEN run side effects.
# Do NOT re-check `player_points matches N..` after the deduction — by definition the player
# now has fewer points, so the check would fail and the rest of the cycle would silently skip.

# Must have a weapon in the target slot
$execute unless score @s gun_$(slot) matches 1.. run return 0


# Snapshot current tier so routing is stable
$scoreboard players operation #pap_tier stats = @s tier_$(slot)

# Ray Gun stops at PaP I and never rolls an element.
$execute if score #pap_tier stats matches 1.. if score @s gun_$(slot) matches 7 run scoreboard players set @s tier_$(slot) 1
$execute if score #pap_tier stats matches 1.. if score @s gun_$(slot) matches 7 run scoreboard players set @s element_$(slot) 0
$execute if score #pap_tier stats matches 1.. if score @s gun_$(slot) matches 7 run tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Ray Gun is already fully Pack-a-Punched","color":"red"}]
$execute if score #pap_tier stats matches 1.. if score @s gun_$(slot) matches 7 run return 0

# === PaP I path (tier was 0): costs 5000 ===
execute if score #pap_tier stats matches ..0 unless score @s player_points matches 5000.. run tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Not enough points! Cost: 5000","color":"red"}]
execute if score #pap_tier stats matches ..0 unless score @s player_points matches 5000.. run return 0

execute if score #pap_tier stats matches ..0 run scoreboard players remove @s player_points 5000
$execute if score #pap_tier stats matches ..0 run scoreboard players set @s pap_pending_slot $(slot)
execute if score #pap_tier stats matches ..0 run scoreboard players set @s pap_pending_tier 1
execute if score #pap_tier stats matches ..0 run function zbk:map_elements/pack_a_punch/management/lose_gun
function zbk:map_elements/pack_a_punch/events/extension/upgrade/apply/after_base_upgrade
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #pap_tier stats matches ..0 at @s run playsound zbk:pack_a_punch.upgrade ambient @s ~ ~ ~ 0.5 1 1
execute if score #pap_tier stats matches ..0 run function zbk:map_elements/pack_a_punch/cycle/on_buy
execute if score #pap_tier stats matches ..0 run return 0

# === PaP II path (tier 1+): costs 2500 ===
execute if score #pap_tier stats matches 1.. unless score @s player_points matches 2500.. run tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Not enough points! Cost: 2500","color":"red"}]
execute if score #pap_tier stats matches 1.. unless score @s player_points matches 2500.. run return 0

execute if score #pap_tier stats matches 1.. run scoreboard players remove @s player_points 2500
$execute if score #pap_tier stats matches 1.. run scoreboard players set @s pap_pending_slot $(slot)
execute if score #pap_tier stats matches 1.. run scoreboard players set @s pap_pending_tier 2
execute if score #pap_tier stats matches 1.. run function zbk:map_elements/pack_a_punch/management/lose_gun
function zbk:map_elements/pack_a_punch/events/extension/upgrade/apply/after_tiered_upgrade
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #pap_tier stats matches 1.. at @s run playsound zbk:pack_a_punch.upgrade ambient @s ~ ~ ~ 0.5 1 1
execute if score #pap_tier stats matches 1.. run function zbk:map_elements/pack_a_punch/cycle/on_buy
