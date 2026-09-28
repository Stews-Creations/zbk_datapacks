execute store result score #radio_rand zbk.nacht run random value 1..3
execute if score #radio_rand zbk.nacht matches 1 run playsound zbk_nacht_der_untoten:nacht_der_untoten.radio.russian_theme music @a ~ ~ ~ 1 1
execute if score #radio_rand zbk.nacht matches 2 run playsound zbk_nacht_der_untoten:nacht_der_untoten.radio.areia music @a ~ ~ ~ 1 1
execute if score #radio_rand zbk.nacht matches 3 run playsound zbk_nacht_der_untoten:nacht_der_untoten.radio.stag_push music @a ~ ~ ~ 1 1
