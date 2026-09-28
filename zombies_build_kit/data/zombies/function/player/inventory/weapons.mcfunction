# Slot-6 Rocket Shield owns the visible main hand. Hide only our gun display item;
# the owned weapon scores stay intact and rebuild the offhand when the shield is put away.
execute if items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s weapon.offhand with minecraft:air
function zombies:combat/weapons/guns/bo3/input/sync
# === WEAPON SYSTEM (Mainhand Slot 3 & Offhand) ===
# Forces knife in mainhand (hotbar slot 3) and active weapon in offhand
# Now works in all game modes

# === FORCE KNIFE IN MAINHAND (Slot 3) ===
# Give the owned knife in hotbar slot 3 if its canonical item is not present.
# Store and give must happen together per player to avoid shared storage conflicts
# Skip if gun is hidden (building mode)
execute unless score @s hide_gun matches 1.. if score @s bowie_knife matches 1.. unless items entity @s hotbar.3 minecraft:netherite_hoe[custom_data~{bowie_knife:true}] run function zombies:player/inventory/give_bowie_knife_wrapper
execute unless score @s hide_gun matches 1.. unless score @s bowie_knife matches 1.. unless items entity @s hotbar.3 minecraft:netherite_hoe[custom_data~{knife:true,bowie_knife:false}] run function zombies:player/inventory/give_knife_wrapper

# === FORCE ACTIVE WEAPON IN OFFHAND ===
# Based on active_weapon score (1=gun_1, 2=gun_2, 3=gun_3), display weapon based on gun_X score
# Gun_X score determines the weapon ID

# Weapon IDs 20-46: BO3 registry; retired IDs migrate before display.

# Ray Gun stops at PaP I and never receives an element.
execute if score @s gun_1 matches 7 if score @s tier_1 matches 2.. run scoreboard players set @s tier_1 1
execute if score @s gun_1 matches 7 if score @s element_1 matches 1.. run scoreboard players set @s element_1 0
execute if score @s gun_2 matches 7 if score @s tier_2 matches 2.. run scoreboard players set @s tier_2 1
execute if score @s gun_2 matches 7 if score @s element_2 matches 1.. run scoreboard players set @s element_2 0
execute if score @s gun_3 matches 7 if score @s tier_3 matches 2.. run scoreboard players set @s tier_3 1
execute if score @s gun_3 matches 7 if score @s element_3 matches 1.. run scoreboard players set @s element_3 0

# === DOWNED PLAYERS - FORCE PISTOL OR RAY GUN ===
# Reuse the real inventory slot display so PaP only appears when that weapon owns it.
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed,scores={gun_1=7}] run function zombies:player/inventory/weapon_displays/gun_1
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed] unless score @s gun_1 matches 7 if score @s gun_2 matches 7 run function zombies:player/inventory/weapon_displays/gun_2
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed] unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 if score @s gun_3 matches 7 run function zombies:player/inventory/weapon_displays/gun_3

execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed] unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 unless score @s gun_3 matches 7 if score @s gun_1 matches 20 run function zombies:player/inventory/weapon_displays/gun_1
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed] unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 unless score @s gun_3 matches 7 unless score @s gun_1 matches 20 if score @s gun_2 matches 20 run function zombies:player/inventory/weapon_displays/gun_2
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed] unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 unless score @s gun_3 matches 7 unless score @s gun_1 matches 20 unless score @s gun_2 matches 20 if score @s gun_3 matches 20 run function zombies:player/inventory/weapon_displays/gun_3

execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=downed] unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 unless score @s gun_3 matches 7 unless score @s gun_1 matches 20 unless score @s gun_2 matches 20 unless score @s gun_3 matches 20 run function zombies:combat/weapons/guns/bo3/display/slot_4

# === CLEAR WEAPONS FROM HOTBAR ===
# Remove any weapons that ended up in hotbar slots (from F press)
# Remove gun display items introduced by an F-key swap; other hotbar items remain untouched.
execute if items entity @s hotbar.0 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.0 with minecraft:air
execute if items entity @s hotbar.1 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.1 with minecraft:air
execute if items entity @s hotbar.2 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.2 with minecraft:air
execute if items entity @s hotbar.3 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.3 with minecraft:air
execute if items entity @s hotbar.4 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.4 with minecraft:air
execute if items entity @s hotbar.5 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.5 with minecraft:air
execute if items entity @s hotbar.6 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.6 with minecraft:air
execute if items entity @s hotbar.7 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.7 with minecraft:air
execute if items entity @s hotbar.8 minecraft:ghast_tear[custom_data~{gun:true}] run item replace entity @s hotbar.8 with minecraft:air


# === DEATH MACHINE OVERRIDE ===
# When the Death Machine powerup is active, replace the offhand with the death machine
# and skip the normal gun rebuild. active_weapon / gun_X scores are never touched,
# so the next tick after cleanup automatically restores the real weapon.
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[tag=death_machine_active,scores={hide_gun=..0}] run function zombies:player/inventory/weapon_displays/death_machine
execute if entity @s[tag=death_machine_active] run return 0

# === ACTIVE WEAPON 1 (gun_1) ===
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=!downed,scores={active_weapon=0,hide_gun=..0}] run function zombies:player/inventory/weapon_displays/gun_1

# === ACTIVE WEAPON 2 (gun_2) ===
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=!downed,scores={active_weapon=1,hide_gun=..0}] run function zombies:player/inventory/weapon_displays/gun_2

# === ACTIVE WEAPON 3 (gun_3) - requires Mule Kick perk
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] if entity @s[team=!downed,scores={active_weapon=2,perk_mule=1..,hide_gun=..0}] run function zombies:player/inventory/weapon_displays/gun_3

# === CLEAR WEAPONS FROM ground ===
# Handled in tick.mcfunction after grenade detection to avoid interfering with grenade throws
