# As the drawing player, at their feet. Returns eligibility without granting a shot.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless score #electric de_el_progress matches 2 run return 0
execute if entity @s[team=downed] run return 0
execute if entity @s[gamemode=spectator] run return 0
execute unless score @s id matches 1.. run return 0
execute unless score @s id = #1 de_bow_owner run return 0
scoreboard players set #de_ec_weapon temp -1
scoreboard players set #de_ec_ammo temp 0
execute if score @s active_weapon matches 0 run scoreboard players operation #de_ec_weapon temp = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #de_ec_weapon temp = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #de_ec_weapon temp = @s gun_3
execute if score @s active_weapon matches 0 run scoreboard players operation #de_ec_ammo temp = @s ammo_1
execute if score @s active_weapon matches 1 run scoreboard players operation #de_ec_ammo temp = @s ammo_2
execute if score @s active_weapon matches 2 run scoreboard players operation #de_ec_ammo temp = @s ammo_3
execute unless score #de_ec_weapon temp matches 11 run return 0
execute unless score #de_ec_ammo temp matches 2.. run return 0
return 1
