$execute unless score #gun_id stats matches 11 as @a[distance=..$(radius)] if score @s id = #shooter_id stats at @s run function zbk:api/combat/weapons/effects/explosive/handle_self_damage
function zbk:api/request/block
