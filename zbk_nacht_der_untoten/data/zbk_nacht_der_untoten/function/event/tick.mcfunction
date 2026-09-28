execute if score #active zbk.nacht matches 1 run function zbk_nacht_der_untoten:on_tick
execute as @a[scores={give_nacht_radio=1..}] if score #active zbk.nacht matches 1 run function zbk_nacht_der_untoten:radio/spawning/spawn_egg
scoreboard players enable @a[scores={give_nacht_radio=1..}] give_nacht_radio
scoreboard players set @a[scores={give_nacht_radio=1..}] give_nacht_radio 0
