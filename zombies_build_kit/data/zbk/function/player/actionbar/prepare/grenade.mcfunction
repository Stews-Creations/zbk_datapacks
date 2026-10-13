# Keep both HUD layouts and the ammo count aligned with the normal grenade slot.
data modify storage zbk:hud args.grenade_color set value "white"
data modify storage zbk:hud args.grenade_offset set value "0"
data modify storage zbk:hud args.grenades set value "\uE001"
execute if score @s grenade_ammo matches ..0 run data modify storage zbk:hud args.grenades set value "\uE002"
execute if score @s perk_widows matches 1.. run data modify storage zbk:hud args.grenades set value "\uE003"
execute if score @s perk_widows matches 1.. if score @s grenade_ammo matches ..0 run data modify storage zbk:hud args.grenade_color set value "#555555"
execute if score @s perk_widows matches 1.. run data modify storage zbk:hud args.grenade_offset set value "-2"
