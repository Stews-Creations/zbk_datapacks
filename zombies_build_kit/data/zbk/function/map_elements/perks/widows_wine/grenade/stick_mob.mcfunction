# Executed at the collision sample's lower corner, as the grenade marker.
tag @e[tag=ww_stick_target] remove ww_stick_target
tag @e[type=zombified_piglin,tag=!combat_ignore,tag=!turned_zombie,tag=!immune_explosives,tag=!monkey_bomb_decoy,tag=!solo_down_decoy,dx=0,dy=0,dz=0,sort=nearest,limit=1] add ww_stick_target
execute unless entity @e[tag=ww_stick_target] run return run function zbk:map_elements/perks/widows_wine/grenade/stick_block
scoreboard players set #ww_strength stats 100
execute as @e[tag=ww_stick_target,limit=1] at @s run function zbk:map_elements/perks/widows_wine/web/apply
ride @s mount @e[tag=ww_stick_target,limit=1]
tag @e[tag=ww_stick_target] remove ww_stick_target
function zbk:map_elements/perks/widows_wine/grenade/stick_block
