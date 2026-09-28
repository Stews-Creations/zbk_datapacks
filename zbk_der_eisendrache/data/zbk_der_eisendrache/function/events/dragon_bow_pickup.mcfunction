# Route the dragon-bow pickup to this active Der Eisendrache provider.
execute unless score #active zbk.de matches 1 run advancement revoke @s only zbk_der_eisendrache:interaction_dragon_bow
execute if score #active zbk.de matches 1 run function zbk_der_eisendrache:quest/bows/default/pickup
