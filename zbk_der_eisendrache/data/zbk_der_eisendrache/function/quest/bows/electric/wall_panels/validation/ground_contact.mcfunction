# Re-read the current footprint instead of trusting a removed platform's cached support.
scoreboard players set #de_ep_solid temp 0
scoreboard players set #de_ep_exempt temp 0
function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/support_sample
execute positioned ~-0.29 ~ ~-0.29 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/support_sample
execute positioned ~-0.29 ~ ~0.29 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/support_sample
execute positioned ~0.29 ~ ~-0.29 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/support_sample
execute positioned ~0.29 ~ ~0.29 run function zbk_der_eisendrache:quest/bows/electric/wall_panels/validation/support_sample
execute if score #de_ep_exempt temp matches 1 run return 0
execute if score #de_ep_solid temp matches 1 run return 1
return 0
