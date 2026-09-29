# Read-only replacement discovery must not advance the spawn cursor or consume random draws.
scoreboard players set #replacement zr_state 0
function zbk:waves/spawning/zombie/selection/config
execute as @a[gamemode=adventure,team=!downed,scores={id=1..}] at @s run function zbk:behavior/relocation/zombie/replacement with storage zbk:zombie_spawn
execute unless score #replacement zr_state matches 1 run return 0
# Budget bounds expensive visibility checks as well as removals.
scoreboard players remove #budget zr_state 1
tag @e[tag=zr_subject] remove zr_subject
tag @s add zr_subject
scoreboard players set #visible zr_state 0
execute as @a[gamemode=adventure,team=!downed] at @s anchored eyes positioned ^ ^ ^ run function zbk:behavior/relocation/zombie/visibility/start
tag @s remove zr_subject
execute if score #visible zr_state matches 1 run return run function zbk:behavior/relocation/zombie/remember
function zbk:behavior/relocation/refunds/refund_zombie
function zbk:debug/info {f:"WAVE",m:"Recovered one stranded zombie and refunded its slot"}
