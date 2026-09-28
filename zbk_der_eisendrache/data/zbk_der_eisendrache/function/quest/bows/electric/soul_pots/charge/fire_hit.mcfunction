# @s remains the shooter at the struck fire. The macro ID is the fire, not the pot.
execute unless score @s de_ec_shot matches 1..3 run return 0
execute unless score @s bow_is_charged matches 1 run return 0
$execute unless score #$(id) de_el_fire_set matches 1 run return 0
$execute if score #$(id) de_ec_fire matches 1 run return 0
$data modify storage zombies:de_soul_pots use set value {fire:$(id)}
execute store result storage zombies:de_soul_pots use.pot int 1 run scoreboard players get @s de_ec_shot
return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/consume with storage zombies:de_soul_pots use
