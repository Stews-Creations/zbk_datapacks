# Shared input can draw any bow; only a usable, fully charged weapon ID 12 qualifies.
execute unless score @s bow_charging matches 1.. run return 0
execute unless score @s bow_charge_time matches 20.. run return 0
execute if entity @s[team=downed] run return 0
execute if entity @s[gamemode=spectator] run return 0
execute if entity @s[nbt={Health:0.0f}] run return 0
execute if score @s active_weapon matches 0 if score @s gun_1 matches 12 if score @s ammo_1 matches 2.. run return 1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 12 if score @s ammo_2 matches 2.. run return 1
execute if score @s active_weapon matches 2 if score @s gun_3 matches 12 if score @s ammo_3 matches 2.. run return 1
return 0
