advancement revoke @s only zombies:rocket_shield_melee
execute if entity @s[tag=rs_melee_processing] run return 0
execute unless entity @s[gamemode=!spectator,team=!downed] run return 0
execute unless score @s rs_owned matches 1 run return 0
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
# The normal shield strike registers the victim and keeps the existing melee points flow.
tag @s add rs_melee_processing
tag @s add rs_melee_actor
execute at @s as @e[type=minecraft:piglin,tag=wave_zombie,tag=!immune_melee,distance=..5,nbt={HurtTime:10s}] run function zombies:combat/weapons/special_equipment/rocket_shield/interactions/melee_target
execute at @s as @e[type=minecraft:wolf,tag=wave_dog,tag=!immune_melee,distance=..5,nbt={HurtTime:10s}] run function zombies:combat/weapons/special_equipment/rocket_shield/interactions/melee_target
tag @s remove rs_melee_actor
tag @s remove rs_melee_processing
