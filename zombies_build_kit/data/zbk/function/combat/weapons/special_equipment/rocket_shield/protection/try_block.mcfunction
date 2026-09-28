# Public gate: as victim, attacker tagged rs_attack_source. Returns 1 only if blocked.
execute unless entity @s[gamemode=!spectator,team=!downed,scores={rs_owned=1,rs_durability=1..}] run return 0
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
execute unless entity @e[tag=rs_attack_source,limit=1] run return 0
scoreboard players set #rs_front temp 0
execute if items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] run scoreboard players set #rs_front temp 1
# Back protection exists only while the head cosmetic (including dog pumpkin) is equipped.
execute if score #rs_front temp matches 0 unless items entity @s armor.head *[custom_data~{rs_head_cosmetic:true}] unless items entity @s armor.head minecraft:carved_pumpkin[custom_model_data={flags:[true,true]}] run return 0
execute store result score #rs_yaw temp run data get entity @s Rotation[0]
# One temporary direction probe per actual hit; no following display entity or idle probe.
execute at @s facing entity @e[tag=rs_attack_source,limit=1] feet summon minecraft:marker run function zbk:combat/weapons/special_equipment/rocket_shield/protection/read_angle
scoreboard players operation #rs_angle temp -= #rs_yaw temp
scoreboard players set #rs_circle temp 360
scoreboard players operation #rs_angle temp %= #rs_circle temp
execute if score #rs_angle temp matches 181.. run scoreboard players remove #rs_angle temp 360
execute if score #rs_front temp matches 1 unless score #rs_angle temp matches -78..78 run return 0
execute if score #rs_front temp matches 0 if score #rs_angle temp matches -101..101 run return 0
function zbk:combat/weapons/special_equipment/rocket_shield/protection/absorb
return 1
