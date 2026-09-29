# A failed entrance returns a slot; a mannequin killed by combat does not.
scoreboard players operation #failed_source wz_state = @s wz_source
execute as @e[type=marker,tag=zombie_spawner] if score @s wz_source = #failed_source wz_state run function zbk:waves/spawning/zombie/animation/marker_failure
function zbk:waves/spawning/zombie/accounting/refund
function zbk:waves/spawning/zombie/cleanup/discard_mannequin
return 0
