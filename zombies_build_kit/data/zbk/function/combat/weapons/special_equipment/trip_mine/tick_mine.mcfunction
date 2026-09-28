# ===================================
# TICK TRIP MINE
# ===================================
# Called as the trip mine marker, positioned at the marker.

execute if entity @s[tag=trip_mine_launching] run return run function zbk:combat/weapons/special_equipment/trip_mine/launch_tick

# Keep the display glued to the marker while the mine is armed.
scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute at @s as @e[type=item_display,tag=trip_mine_display] if score @s grenade_id = #current_grenade_id grenade_id run tp @s ~ ~0.35 ~

# Short arming window so the owner does not instantly trip it.
execute if score @s timer matches 1.. run scoreboard players remove @s timer 1
execute if score @s timer matches 1.. run particle minecraft:smoke ~ ~0.25 ~ 0.05 0.05 0.05 0.01 1 force
execute if score @s timer matches 1.. run return 0

execute if entity @e[type=!#zbk:not_mob,type=!player,tag=!combat_ignore,tag=!immune_explosives,tag=!monkey_bomb_decoy,tag=!solo_down_decoy,tag=!turned_zombie,distance=..2] run function zbk:combat/weapons/special_equipment/trip_mine/trigger_trip_mine
