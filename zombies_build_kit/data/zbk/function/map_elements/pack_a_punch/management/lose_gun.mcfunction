# Called from each slot_X buy success branch AFTER pap_pending_slot and pap_pending_tier
# are set. Snapshots the gun id (so claim can restore it), clears the slot, auto-switches
# active_weapon to another non-empty slot when available, then refreshes inventory.

# Snapshot the gun id for the slot being PaP'd — claim reads this later.
execute if score @s pap_pending_slot matches 1 run scoreboard players operation @s pap_pending_gun_id = @s gun_1
execute if score @s pap_pending_slot matches 2 run scoreboard players operation @s pap_pending_gun_id = @s gun_2
execute if score @s pap_pending_slot matches 3 run scoreboard players operation @s pap_pending_gun_id = @s gun_3

# Clear the slot — gun and tier both go to 0.
execute if score @s pap_pending_slot matches 1 run scoreboard players set @s gun_1 0
execute if score @s pap_pending_slot matches 1 run scoreboard players set @s tier_1 0
execute if score @s pap_pending_slot matches 2 run scoreboard players set @s gun_2 0
execute if score @s pap_pending_slot matches 2 run scoreboard players set @s tier_2 0
execute if score @s pap_pending_slot matches 3 run scoreboard players set @s gun_3 0
execute if score @s pap_pending_slot matches 3 run scoreboard players set @s tier_3 0

# Auto-switch active_weapon to a non-empty slot.
# pending=1: prefer slot 2, else slot 3
execute if score @s pap_pending_slot matches 1 if score @s gun_2 matches 1.. run scoreboard players set @s active_weapon 1
execute if score @s pap_pending_slot matches 1 if score @s gun_2 matches ..0 if score @s gun_3 matches 1.. run scoreboard players set @s active_weapon 2
# pending=2: prefer slot 1, else slot 3
execute if score @s pap_pending_slot matches 2 if score @s gun_1 matches 1.. run scoreboard players set @s active_weapon 0
execute if score @s pap_pending_slot matches 2 if score @s gun_1 matches ..0 if score @s gun_3 matches 1.. run scoreboard players set @s active_weapon 2
# pending=3: prefer slot 1, else slot 2
execute if score @s pap_pending_slot matches 3 if score @s gun_1 matches 1.. run scoreboard players set @s active_weapon 0
execute if score @s pap_pending_slot matches 3 if score @s gun_1 matches ..0 if score @s gun_2 matches 1.. run scoreboard players set @s active_weapon 1

# Apply the inventory changes (knife placeholder for the empty slot, new active weapon visible).
function zbk:player/inventory/weapons
