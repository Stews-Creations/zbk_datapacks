# Downed weapons consume their own slot; a temporary MR6 has its own ammunition.
execute if entity @s[tag=death_machine_active] run return 0
execute if score @s hide_gun matches 1.. run return 0
execute if entity @s[team=downed] run return run function zombies:combat/weapons/guns/bo3/input/downed
execute if score @s active_weapon matches 0 if score @s gun_1 matches 20..46 run function zombies:combat/weapons/guns/bo3/input/slot_1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 20..46 run function zombies:combat/weapons/guns/bo3/input/slot_2
execute if score @s active_weapon matches 2 if score @s perk_mule matches 1.. if score @s gun_3 matches 20..46 run function zombies:combat/weapons/guns/bo3/input/slot_3
