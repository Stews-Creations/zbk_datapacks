execute if score #gun_id stats matches 11 if score #is_explosive stats matches 1 run particle minecraft:explosion ~ ~ ~ 1 1 1 0.1 5 force
execute if score #gun_id stats matches 11 if score #is_explosive stats matches 1 run playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 1 1.2
