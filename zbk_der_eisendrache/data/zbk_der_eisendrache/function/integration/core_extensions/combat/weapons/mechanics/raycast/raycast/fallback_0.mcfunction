execute unless score #active zbk.de matches 1 run return 0
execute as @s if score #tier stats matches 1.. unless score #gun_id stats matches 2 unless score #gun_id stats matches 7 unless score #gun_id stats matches 11..12 run function zbk:combat/weapons/effects/particles/bullet_trail
function zbk:global/events/request/block
