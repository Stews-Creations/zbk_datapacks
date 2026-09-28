execute if score @s de_eb_slot matches 1..3 run return 0
execute if score @s pap_pending_slot matches 1..3 run return run tellraw @s {"text":"Collect your Pack-a-Punch weapon first.","color":"yellow"}
execute unless items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{gun:true,gun_id:11}] run return run tellraw @s {"text":"Hold the original bow to offer it.","color":"yellow"}
execute if score @s hide_gun matches 1.. run return 0
execute if entity @s[tag=death_machine_active] run return 0
execute if score @s gun_1 matches 12 run return 0
execute if score @s gun_2 matches 12 run return 0
execute if score @s gun_3 matches 12 run return 0
execute if score @s active_weapon matches 0 if score @s gun_1 matches 11 run return run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/deposit {slot:1}
execute if score @s active_weapon matches 1 if score @s gun_2 matches 11 run return run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/deposit {slot:2}
execute if score @s active_weapon matches 2 if score @s perk_mule matches 1.. if score @s gun_3 matches 11 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/reward/deposit {slot:3}
