# Activate Pack-a-Punch at this map location. Called as/at a
# map_pack_a_punch_location marker. The active structure supplies a
# persistent de_pack_spawn marker; a real Pack-a-Punch machine marker is
# summoned at that anchor.

kill @e[type=interaction,distance=..2,tag=map_pack_a_punch_ui]
kill @e[type=item_display,distance=..2,tag=map_pack_a_punch_ui]
kill @e[type=text_display,distance=..2,tag=map_pack_a_punch_ui]

tag @s add map_pack_a_punch_active

scoreboard players set @s map_pap_uses 0
scoreboard players set @s map_pap_rounds 0
tag @s remove map_pap_move_pending

tag @e[type=marker,tag=de_pack_a_punch_pending] remove de_pack_a_punch_pending
execute unless entity @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] as @e[type=marker,distance=..8,tag=!map_pack_a_punch_location,tag=!de_pack_a_punch_location,limit=1,sort=nearest] run tag @s add de_pack_spawn
execute unless entity @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run summon marker ~ ~ ~ {Tags:["de_pack_spawn"]}
execute if entity @s[tag=map_pap_south] at @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run summon marker ~ ~-0.1 ~1.1 {Tags:["de_pack_a_punch_pending","de_pack_a_punch_location","zbk.custom_presentation","pack_a_punch","pack_a_punch_initialized"]}
execute if entity @s[tag=map_pap_west] at @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run summon marker ~-1.1 ~-0.1 ~ {Tags:["de_pack_a_punch_pending","de_pack_a_punch_location","zbk.custom_presentation","pack_a_punch","pack_a_punch_initialized"]}
execute if entity @s[tag=map_pap_north] at @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run summon marker ~ ~-0.1 ~-1.1 {Tags:["de_pack_a_punch_pending","de_pack_a_punch_location","zbk.custom_presentation","pack_a_punch","pack_a_punch_initialized"]}
execute if entity @s[tag=map_pap_east] at @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run summon marker ~1.1 ~-0.1 ~ {Tags:["de_pack_a_punch_pending","de_pack_a_punch_location","zbk.custom_presentation","pack_a_punch","pack_a_punch_initialized"]}
execute unless entity @s[tag=map_pap_south] unless entity @s[tag=map_pap_west] unless entity @s[tag=map_pap_north] unless entity @s[tag=map_pap_east] at @e[type=marker,distance=..8,tag=de_pack_spawn,limit=1,sort=nearest] run summon marker ~ ~-0.1 ~ {Tags:["de_pack_a_punch_pending","de_pack_a_punch_location","zbk.custom_presentation","pack_a_punch","pack_a_punch_initialized"]}

execute unless entity @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tellraw @a [{"text":"[Map Pack-a-Punch] ","color":"light_purple"},{"text":"No de_pack_spawn marker found in the active structure.","color":"red"}]

execute if entity @s[tag=map_pap_south] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add de_pack_a_punch_south
execute if entity @s[tag=map_pap_south] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add pack_a_punch_south
execute if entity @s[tag=map_pap_west] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add de_pack_a_punch_west
execute if entity @s[tag=map_pap_west] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add pack_a_punch_west
execute if entity @s[tag=map_pap_north] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add de_pack_a_punch_north
execute if entity @s[tag=map_pap_north] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add pack_a_punch_north
execute if entity @s[tag=map_pap_east] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add de_pack_a_punch_east
execute if entity @s[tag=map_pap_east] as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] run tag @s add pack_a_punch_east

execute as @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] at @s run function zbk_der_eisendrache:map_pack_a_punch/machine/model/create
tag @e[type=marker,distance=..8,tag=de_pack_a_punch_pending,limit=1,sort=nearest] remove de_pack_a_punch_pending
