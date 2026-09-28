# Called once per held-draw callback after acquiring a soul-pot charge.
scoreboard players add @s de_ec_audio 0
execute if score @s de_ec_audio matches 1.. run scoreboard players remove @s de_ec_audio 1
execute if score @s de_ec_audio matches 1.. run return 0
execute at @s run playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.stormbow_arrowhead master @s ~ ~ ~ 1 1
# The stereo clip lasts 3.456 seconds; repeat every 70 ticks (3.5 seconds).
scoreboard players set @s de_ec_audio 70
