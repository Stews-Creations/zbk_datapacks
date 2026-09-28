execute if score #gun_id stats matches 11 store result score #de_el_fire_hit stats run function zbk_der_eisendrache:events/electric_bow_fire_shot
execute if score #gun_id stats matches 11 if score #de_el_fire_hit stats matches 1 run function zbk:api/request/complete {result:1}
