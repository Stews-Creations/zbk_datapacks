# Give ray_gun (ID: 7) using smart weapon assignment
# Priority 0: If no gun in slot 1 (gun_1 = 0), add to slot 1
# Priority 1: If gun in slot 1 but no gun in slot 2 (gun_2 = 0), add to slot 2
# Priority 2: If guns in slots 1&2 but no gun in slot 3 (gun_3 = 0) + Mule Kick, add to slot 3
# Priority 3: Otherwise replace current active weapon

#Check if a slot was updated
scoreboard players set #updated stats 0

# Priority 0: No gun in slot 1 - add to slot 1 and set as active
execute if score @s gun_1 matches 0 run scoreboard players set #updated stats 1
execute if score @s gun_1 matches 0 run function zbk:combat/weapons/guns/ray_gun/give/slot_1 with storage zbk:weapons guns.ray_gun
execute if score #updated stats matches 1 run scoreboard players set @s active_weapon 0
execute if score #updated stats matches 1 run return fail

# Priority 1: Has gun in slot 1, no gun in slot 2 - add to slot 2 and switch to it
execute if score @s gun_2 matches 0 run scoreboard players set #updated stats 1
execute if score @s gun_2 matches 0 run function zbk:combat/weapons/guns/ray_gun/give/slot_2 with storage zbk:weapons guns.ray_gun
execute if score #updated stats matches 1 run scoreboard players set @s active_weapon 1
execute if score #updated stats matches 1 run return fail

# Priority 2: Has guns in slots 1&2, no gun in slot 3, has Mule Kick - add to slot 3 and switch to it
execute if score @s gun_3 matches 0 if score @s perk_mule matches 1.. run scoreboard players set #updated stats 1
execute if score @s gun_3 matches 0 if score @s perk_mule matches 1.. run function zbk:combat/weapons/guns/ray_gun/give/slot_3 with storage zbk:weapons guns.ray_gun
execute if score #updated stats matches 1 run scoreboard players set @s active_weapon 2
execute if score #updated stats matches 1 run return fail

# Priority 3: Replace current active weapon slot
execute if score @s active_weapon matches 0 run function zbk:combat/weapons/guns/ray_gun/give/slot_1 with storage zbk:weapons guns.ray_gun
execute if score @s active_weapon matches 1 run function zbk:combat/weapons/guns/ray_gun/give/slot_2 with storage zbk:weapons guns.ray_gun
execute if score @s active_weapon matches 2 run function zbk:combat/weapons/guns/ray_gun/give/slot_3 with storage zbk:weapons guns.ray_gun
