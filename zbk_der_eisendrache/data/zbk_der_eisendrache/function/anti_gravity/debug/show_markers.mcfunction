# Display all anti-gravity placement markers requested by debug players.
function zbk_der_eisendrache:anti_gravity/debug/show_portals
function zbk_der_eisendrache:anti_gravity/debug/show_plates
execute at @e[type=minecraft:marker,tag=de_ag_recovery] run particle minecraft:dust{color:[1.0,0.75,0.0],scale:1.0} ~ ~0.2 ~ 0.2 0.1 0.2 0 2 normal @a[tag=de_ag_debug]
