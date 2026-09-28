scoreboard players remove @s rs_durability 1
execute at @s run playsound zombies:rocket_shield.impact player @a[distance=..16] ~ ~ ~ 1 1
execute if score @s rs_durability matches ..0 run return run function zombies:combat/weapons/special_equipment/rocket_shield/protection/break
function zombies:combat/weapons/special_equipment/rocket_shield/display/update_durability
