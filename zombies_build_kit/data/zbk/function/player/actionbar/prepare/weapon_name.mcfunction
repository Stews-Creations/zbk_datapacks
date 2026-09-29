# Use the selected slot's upgrade tier to choose its display name.
data modify storage zbk:temp gun_name set value "WEAPON"
scoreboard players set #gun_id temp 0
scoreboard players set #pap_tier temp 0
execute if score @s active_weapon matches 0 run scoreboard players operation #gun_id temp = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #gun_id temp = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #gun_id temp = @s gun_3
execute if score @s active_weapon matches 0 run scoreboard players operation #pap_tier temp = @s tier_1
execute if score @s active_weapon matches 1 run scoreboard players operation #pap_tier temp = @s tier_2
execute if score @s active_weapon matches 2 run scoreboard players operation #pap_tier temp = @s tier_3
execute if score #gun_id temp matches 20..46 run function zbk:combat/weapons/guns/bo3/registry/name
execute if score #gun_id temp matches 7 run data modify storage zbk:temp gun_name set value "RAY GUN"
function zbk:player/events/extension/actionbar/prepare/weapon_name/after_base_name
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #pap_tier temp matches 1.. if score #gun_id temp matches 20..46 run function zbk:combat/weapons/guns/bo3/registry/name_pap
execute if score #pap_tier temp matches 1.. if score #gun_id temp matches 7 run data modify storage zbk:temp gun_name set from storage zbk:weapons guns.ray_gun.pap_name
function zbk:player/events/extension/actionbar/prepare/weapon_name/after_upgrade_name
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if entity @s[tag=death_machine_active] run data modify storage zbk:temp gun_name set value "DEATH MACHINE"
data modify storage zbk:hud args.weapon_name set from storage zbk:temp gun_name
execute store result score #hud_name_width temp run data get storage zbk:hud args.weapon_name
data modify storage zbk:hud args.weapon_font set value "zbk:hud_label"
scoreboard players set #hud_label_cell temp 3
execute if score #hud_name_width temp matches 14.. run data modify storage zbk:hud args.weapon_font set value "zbk:hud_label_small"
execute if score #hud_name_width temp matches 14.. run scoreboard players set #hud_label_cell temp 2
scoreboard players operation #hud_name_width temp *= #hud_label_cell temp
scoreboard players operation #hud_name_half temp = #hud_name_width temp
scoreboard players set #hud_two temp 2
scoreboard players operation #hud_name_half temp /= #hud_two temp
scoreboard players set #hud_name_left temp -88
execute if score @s gun_side matches 2 run scoreboard players set #hud_name_left temp 92
scoreboard players operation #hud_name_left temp -= #hud_name_half temp
execute store result storage zbk:hud args.weapon_offset int 1 run scoreboard players get #hud_name_left temp
scoreboard players set #hud_name_back temp 0
scoreboard players operation #hud_name_back temp -= #hud_name_left temp
scoreboard players operation #hud_name_back temp -= #hud_name_width temp
execute store result storage zbk:hud args.weapon_return int 1 run scoreboard players get #hud_name_back temp
