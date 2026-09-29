# Global tick listener. Run radio logic only while Nacht is active, then clear used builder triggers.
execute if score #active zbk.nacht matches 1 run function zbk_nacht_der_untoten:dr_monty_radio/on_tick
execute as @a[scores={give_nacht_radio=1..}] if score #active zbk.nacht matches 1 run function zbk_nacht_der_untoten:dr_monty_radio/spawning/spawn_egg
scoreboard players enable @a[scores={give_nacht_radio=1..}] give_nacht_radio
scoreboard players set @a[scores={give_nacht_radio=1..}] give_nacht_radio 0
