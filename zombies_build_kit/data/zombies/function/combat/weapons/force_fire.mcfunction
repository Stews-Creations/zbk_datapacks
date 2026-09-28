# ===================================
# FORCE FIRE - GENERIC WEAPON FIRE
# ===================================
# Purpose: Fire the player's active weapon as if they right-clicked
# Called as @s = the player
# Useful for interaction entities that intercept right-click but should still fire the gun
# Uses active_weapon (0/1/2) and gun_1/gun_2/gun_3 scores to determine which gun to fire

# Determine active gun_id based on active weapon slot
execute if entity @s[team=downed] if items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{bo3:true,gun_id:20}] run scoreboard players set #force_fire_gun_id stats 20
execute if entity @s[team=downed] if items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{gun_id:7}] run scoreboard players set #force_fire_gun_id stats 7
execute unless entity @s[team=downed] if score @s active_weapon matches 0 run scoreboard players operation #force_fire_gun_id stats = @s gun_1
execute unless entity @s[team=downed] if score @s active_weapon matches 1 run scoreboard players operation #force_fire_gun_id stats = @s gun_2
execute unless entity @s[team=downed] if score @s active_weapon matches 2 run scoreboard players operation #force_fire_gun_id stats = @s gun_3

# Dispatch to the correct weapon's fire function based on gun_id
# 1 = Double Barrel Shotgun
execute if score #force_fire_gun_id stats matches 1 run function zombies:combat/weapons/guns/double_barrel_shotgun/fire
# 2 = Flame Thrower
execute if score #force_fire_gun_id stats matches 2 run function zombies:combat/weapons/guns/flame_thrower/fire
# 3 = Grenade Launcher
execute if score #force_fire_gun_id stats matches 3 run function zombies:combat/weapons/guns/grenade_launcher/fire
# 4 = Light Machine Gun
execute if score #force_fire_gun_id stats matches 4 run function zombies:combat/weapons/guns/light_machine_gun/fire
# 5 = Pistol
execute if score #force_fire_gun_id stats matches 5 run function zombies:combat/weapons/guns/pistol/fire
# 6 = Rainbow Rifle
execute if score #force_fire_gun_id stats matches 6 run function zombies:combat/weapons/guns/rainbow_rifle/fire
# 7 = Ray Gun
execute if score #force_fire_gun_id stats matches 7 run function zombies:combat/weapons/guns/ray_gun/fire
# 8 = Rifle
execute if score #force_fire_gun_id stats matches 8 run function zombies:combat/weapons/guns/rifle/fire
# 9 = Shotgun
execute if score #force_fire_gun_id stats matches 9 run function zombies:combat/weapons/guns/shotgun/fire
# 10 = Sniper
execute if score #force_fire_gun_id stats matches 10 run function zombies:combat/weapons/guns/sniper/fire
function zbk:dispatch/extension/combat/weapons/force_fire/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/combat/weapons/force_fire/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# BO3 integration
execute if score #force_fire_gun_id stats matches 20..46 run function zombies:combat/weapons/guns/bo3/input/use
