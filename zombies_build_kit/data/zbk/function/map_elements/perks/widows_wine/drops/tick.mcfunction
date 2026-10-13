# Reject drops from before reset/reload before particles or pickup checks.
execute unless score @s perk_epoch = #current perk_epoch run return run kill @s
scoreboard players remove @s ww_timer 1
execute if score @s ww_timer matches ..0 run return run kill @s
# Match normal powerup rotation: two degrees per tick, without moving the pickup.
tp @s ~ ~ ~ ~-2 ~
# A small blue halo, four times per second, while the pickup exists.
scoreboard players operation #ww_spark stats = @s ww_timer
scoreboard players set #ww_spark_period stats 5
scoreboard players operation #ww_spark stats %= #ww_spark_period stats
execute if score #ww_spark stats matches 0 run function zbk:map_elements/perks/widows_wine/drops/particles
scoreboard players operation #ww_claim_owner stats = @s ww_owner
tag @s add ww_pickup_selected
execute as @a[distance=..1.5,team=!downed,scores={id=1..,perk_widows=1..,grenade_ammo=..3}] if score @s id = #ww_claim_owner stats at @s run function zbk:map_elements/perks/widows_wine/drops/claim
tag @s remove ww_pickup_selected
