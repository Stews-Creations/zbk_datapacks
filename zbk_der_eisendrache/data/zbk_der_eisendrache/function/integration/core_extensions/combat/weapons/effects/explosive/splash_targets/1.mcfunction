$execute unless score #gun_id stats matches 11 as @a[distance=..$(radius)] if score @s id = #shooter_id stats at @s run function zbk:combat/weapons/effects/explosive/damage/handle_self_damage
function zbk:global/events/request/block
