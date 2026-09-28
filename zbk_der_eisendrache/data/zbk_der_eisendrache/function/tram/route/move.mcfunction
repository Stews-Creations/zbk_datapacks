# Resolve target tags afresh for this tram before movement and arrival checks.
# The shared arrival sound latch must be written before another tram evaluates the threshold.

# Resolve this tram's current destination from its Link ID.
# Destination: 1 = Start, 2 = Middle, 3 = End/Stop.
execute store result score #active_tram_link global run scoreboard players get @s tram_link_id
tag @e[type=marker,tag=tram_route_target] remove tram_route_target
execute if score @s tram_destination matches 1 as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global run tag @s add tram_route_target
execute if score @s tram_destination matches 2 as @e[type=marker,tag=tram_middle,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global run tag @s add tram_route_target
execute if score @s tram_destination matches 3 as @e[type=marker,tag=tram_stop,scores={tram_link_id=1..}] if score @s tram_link_id = #active_tram_link global run tag @s add tram_route_target

# Stop safely when this tram has no matching destination marker.
execute unless entity @e[type=marker,tag=tram_route_target,limit=1] run scoreboard players set @s tram_timer 200

# Whichever paired tram first reaches the 5-block arrival threshold announces it globally once.
execute if score @s tram_timer matches ..199 if score #tram_arriving_sound global matches 0 if entity @e[type=marker,tag=tram_route_target,distance=..5,limit=1] run function zbk_der_eisendrache:tram/route/audio/arriving

# Travel until the destination is within one movement step, then land exactly on it.
execute if score @s tram_timer matches ..199 if entity @e[type=marker,tag=tram_route_target,distance=..0.21,limit=1] run function zbk_der_eisendrache:tram/route/arrive
execute if score @s tram_timer matches ..199 facing entity @e[type=marker,tag=tram_route_target,limit=1] feet run tp @s ^ ^ ^0.2
