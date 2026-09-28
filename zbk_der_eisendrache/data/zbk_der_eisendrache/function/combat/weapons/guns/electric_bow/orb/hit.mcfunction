# Orb victim at its feet; #player stats was restored from the owning orb.
# Shared collision awards points, kill statistics, voice, loot and model cleanup.
execute if entity @s[tag=immune_elements] run return 0
execute if entity @s[tag=immune_guns] run return 0
execute if entity @s[tag=combat_ignore] run return 0
execute if entity @s[tag=turned_zombie] run return 0
execute if entity @s[tag=monkey_bomb_decoy] run return 0
execute if entity @s[tag=solo_down_decoy] run return 0
scoreboard players set #gun_id stats 12
scoreboard players set #electric_storm_pending stats 0
scoreboard players set #electric_orb_pending stats 0
scoreboard players set #damage stats 45
scoreboard players set #tier stats 0
scoreboard players set #element stats 0
scoreboard players set #is_piercing stats 1
scoreboard players set #is_explosive stats 0
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.15 8 force
# Slowness VII reduces normal walking speed to zero; refreshed every 0.5 seconds.
effect give @s minecraft:slowness 1 6 true
function zbk:api/combat/weapons/mechanics/raycast/collide
tag @s remove raycast_hit
