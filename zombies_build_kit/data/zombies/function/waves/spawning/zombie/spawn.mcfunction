# One spawn opportunity. Player discovery is bounded by the eligible player set.
scoreboard players set #success wz_state 0
tag @a[tag=wz_tried] remove wz_tried
function zombies:waves/spawning/zombie/selection/players
tag @a[tag=wz_tried] remove wz_tried
return run scoreboard players get #success wz_state
