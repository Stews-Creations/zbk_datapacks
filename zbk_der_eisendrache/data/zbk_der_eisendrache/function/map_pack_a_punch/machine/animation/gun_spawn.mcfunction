# Der Eisendrache Pack-a-Punch gun spawn wrapper.
# Uses the normal gun model selection, then raises this machine's gun animation by 0.25 blocks.

function zbk:api/map_elements/pack_a_punch/animations/gun_spawn

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run tag @s add de_pack_a_punch_entity
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] run tag @s add de_pack_a_punch_model

execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_south,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.65f,-0.7f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_north,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0f,1.65f,0.7f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_east,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [-0.7f,1.65f,0f]
execute as @e[type=item_display,distance=..3,tag=pap_gun_buyin,tag=pack_a_punch_gun_west,limit=1,sort=nearest] run data modify entity @s transformation.translation set value [0.7f,1.65f,0f]
