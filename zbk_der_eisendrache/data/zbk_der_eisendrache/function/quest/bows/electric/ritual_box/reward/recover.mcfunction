# Called by the shared inventory event, including after reconnect or map cleanup.
execute unless score @s de_eb_slot matches 1..3 run return 0
execute if score #phase de_eb_state matches 3..4 if score @s id = #buyer de_eb_owner run return 0
function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/find_slot
execute if score #target de_eb_slot matches 0 run return 0
execute if score #target de_eb_slot matches 1 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/refund {slot:1}
execute if score #target de_eb_slot matches 2 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/refund {slot:2}
execute if score #target de_eb_slot matches 3 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/refund {slot:3}
scoreboard players reset @s de_eb_slot
scoreboard players reset @s de_eb_tier
scoreboard players reset @s de_eb_elem
scoreboard players reset @s de_eb_ammo
execute at @s run function zbk:api/player/inventory/weapons
