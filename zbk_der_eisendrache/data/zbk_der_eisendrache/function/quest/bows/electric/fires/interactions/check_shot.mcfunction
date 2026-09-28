execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute if entity @s[team=downed] run return 0
execute unless score @s id matches 1.. run return 0
execute unless score @s id = #1 de_bow_owner run return 0
execute unless score #electric de_el_progress matches 0 unless score #electric de_el_progress matches 2 run return 0
# The shared profile includes other bows: inspect the actual active slot.
scoreboard players set #de_el_fire_weapon stats -1
execute if score @s active_weapon matches 0 run scoreboard players operation #de_el_fire_weapon stats = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #de_el_fire_weapon stats = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #de_el_fire_weapon stats = @s gun_3
execute unless score #de_el_fire_weapon stats matches 11 run return 0
tag @e[type=interaction,tag=de_el_fire_hit] remove de_el_fire_hit
# Fetch the three targets before testing their bounds. A spatial @e lookup can
# omit wide interactions whose origins are across a chunk-section boundary.
execute as @e[type=interaction,tag=de_el_fire_target] if entity @s[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run tag @s add de_el_fire_hit
execute unless entity @e[type=interaction,tag=de_el_fire_hit] run return 0
execute store result storage zombies:de_electric_fire hit.id int 1 run scoreboard players get @e[type=interaction,tag=de_el_fire_hit,sort=nearest,limit=1] de_el_fire_id
execute if score #electric de_el_progress matches 2 run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/fire_hit with storage zombies:de_electric_fire hit
return run function zbk_der_eisendrache:quest/bows/electric/fires/interactions/ignite with storage zombies:de_electric_fire hit
