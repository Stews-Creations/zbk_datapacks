# Runs as a grenade marker at each physics sub-step. The existing Tram 1 root is the only detector entity.
execute unless score #global game_active matches 1.. run return 0
execute unless entity @s[type=minecraft:marker,tag=active_grenade,tag=hand_grenade,tag=!tram_ee_grenade_checked] run return 0

# The 9x5x5 box is active at game start, then follows Tram 1 until it reaches Middle.
execute at @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1,tram_destination=0,tram_timer=200,tram_delay_timer=..-1},limit=1] positioned ~ ~-1 ~ if entity @s[dx=9,dy=5,dz=5] run function zbk_der_eisendrache:tram/easter_egg/qualification/qualify
execute at @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1,tram_destination=2,tram_delay_timer=0..},limit=1] positioned ~ ~-1 ~ if entity @s[dx=9,dy=5,dz=5] run function zbk_der_eisendrache:tram/easter_egg/qualification/qualify
execute at @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1,tram_destination=2,tram_timer=..199},limit=1] positioned ~ ~-1 ~ if entity @s[dx=9,dy=5,dz=5] run function zbk_der_eisendrache:tram/easter_egg/qualification/qualify
