# Refill only an owned slot-6 shield. Preserve all unrelated components.
execute unless score @s rs_owned matches 1 run return run tellraw @s {text:"You do not have a Rocket Shield. Use Give Shield first.",color:"yellow"}
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return run tellraw @s {text:"Your Rocket Shield must be in slot 6 to refill it.",color:"yellow"}
scoreboard players set @s rs_durability 15
scoreboard players set @s rs_charges 3
item modify entity @s hotbar.5 zbk:rocket_shield_refill
tellraw @s {text:"Rocket Shield refilled: 3 boosts and full durability.",color:"green"}
