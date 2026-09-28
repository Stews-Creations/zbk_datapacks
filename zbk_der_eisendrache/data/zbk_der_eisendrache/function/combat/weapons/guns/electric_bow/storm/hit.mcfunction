# Storm victim at its feet; #player stats was restored from the owning storm.
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
# Only ordinary zombies and dogs are eligible; bosses never inherit the lethal pulse.
execute unless entity @s[type=zombified_piglin] unless entity @s[type=wolf] run return 0
execute if entity @s[tag=panzer_ai] run return 0
# Round remaining health upward so fractional-health victims also die on this pulse.
execute store result score #damage stats run data get entity @s Health 100
scoreboard players add #damage stats 99
scoreboard players set #storm_damage_scale stats 100
scoreboard players operation #damage stats /= #storm_damage_scale stats
scoreboard players set #tier stats 0
scoreboard players set #element stats 0
scoreboard players set #is_piercing stats 1
scoreboard players set #is_explosive stats 0
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.15 8 force
# Slowness VII reduces normal walking speed to zero; refreshed every 0.5 seconds.
effect give @s minecraft:slowness 1 6 true
function zbk:api/combat/weapons/mechanics/raycast/collide
tag @s remove raycast_hit
