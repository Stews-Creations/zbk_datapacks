# Run as the player inspecting the HUD. Shared powerups/round affect the session.
execute unless entity @s[type=minecraft:player] run return 0

# Deterministic acquisition order at the normal four-perk limit.
scoreboard players set @s perk_count 4
scoreboard players set @s perk_order 4
scoreboard players set @s perk_jugg 1
scoreboard players set @s perk_stamina 2
scoreboard players set @s perk_speed 3
scoreboard players set @s perk_doubletap 4
scoreboard players set @s perk_revive 0
scoreboard players set @s perk_mule 0

# Refresh/migrate the held weapon before packing its active slot.
function zbk:player/inventory/weapons
execute if score @s active_weapon matches 0 if score @s gun_1 matches 1.. unless score @s tier_1 matches 1.. run scoreboard players set @s tier_1 1
execute if score @s active_weapon matches 0 if score @s gun_1 matches 20..46 run function zbk:combat/weapons/guns/bo3/inventory/pack {slot:1}
execute if score @s active_weapon matches 0 unless score @s gun_1 matches 1.. run tellraw @s {"text":"[HUD Test] No gun in the active slot to pack.","color":"yellow"}
execute if score @s active_weapon matches 1 if score @s gun_2 matches 1.. unless score @s tier_2 matches 1.. run scoreboard players set @s tier_2 1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 20..46 run function zbk:combat/weapons/guns/bo3/inventory/pack {slot:2}
execute if score @s active_weapon matches 1 unless score @s gun_2 matches 1.. run tellraw @s {"text":"[HUD Test] No gun in the active slot to pack.","color":"yellow"}
execute if score @s active_weapon matches 2 if score @s gun_3 matches 1.. unless score @s tier_3 matches 1.. run scoreboard players set @s tier_3 1
execute if score @s active_weapon matches 2 if score @s gun_3 matches 20..46 run function zbk:combat/weapons/guns/bo3/inventory/pack {slot:3}
execute if score @s active_weapon matches 2 unless score @s gun_3 matches 1.. run tellraw @s {"text":"[HUD Test] No gun in the active slot to pack.","color":"yellow"}

# The three actionbar powerups use their real activation and expiration paths.
function zbk:combat/powerups/insta_kill/activate
function zbk:combat/powerups/double_points/activate
function zbk:combat/powerups/fire_sale/activate
scoreboard players set #global wave.round 5
function zbk:player/inventory/weapons
function zbk:player/actionbar/display
function zbk:player/xpbar/display
tellraw @s {"text":"[HUD Test] Four perks, active gun packed, timed powerups active, round 5.","color":"gold"}
