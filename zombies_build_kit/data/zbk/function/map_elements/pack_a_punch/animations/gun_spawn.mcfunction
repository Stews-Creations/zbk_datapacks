# Called as @s = the PaP marker. Summons the gun item_display at the "outside"
# position (matching the purchase text), per direction. Initial item_model is a
# placeholder ("zbk:guns/pistols/mr6") and gets overwritten by the dispatch below based
# on #pap_gun_id stats. The slide-in animation is kicked off on the next tick.

# Per-direction summon with the correct left_rotation + starting translation.
execute if entity @s[tag=pack_a_punch_south] at @s run summon item_display ~ ~ ~ {view_range:0.5f,Tags:["pack_a_punch_gun_display","pack_a_punch_ui","pack_a_punch_gun_south","pap_gun_buyin"],brightness:{block:15,sky:15},teleport_duration:0,interpolation_duration:0,item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:guns/pistols/mr6"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.15f,-0.7f],scale:[0.75f,0.75f,0.75f]}}
execute if entity @s[tag=pack_a_punch_north] at @s run summon item_display ~ ~ ~ {view_range:0.5f,Tags:["pack_a_punch_gun_display","pack_a_punch_ui","pack_a_punch_gun_north","pap_gun_buyin"],brightness:{block:15,sky:15},teleport_duration:0,interpolation_duration:0,item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:guns/pistols/mr6"}},transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.15f,0.7f],scale:[0.75f,0.75f,0.75f]}}
execute if entity @s[tag=pack_a_punch_east] at @s run summon item_display ~ ~ ~ {view_range:0.5f,Tags:["pack_a_punch_gun_display","pack_a_punch_ui","pack_a_punch_gun_east","pap_gun_buyin"],brightness:{block:15,sky:15},teleport_duration:0,interpolation_duration:0,item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:guns/pistols/mr6"}},transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[-0.7f,1.15f,0f],scale:[0.75f,0.75f,0.75f]}}
execute if entity @s[tag=pack_a_punch_west] at @s run summon item_display ~ ~ ~ {view_range:0.5f,Tags:["pack_a_punch_gun_display","pack_a_punch_ui","pack_a_punch_gun_west","pap_gun_buyin"],brightness:{block:15,sky:15},teleport_duration:0,interpolation_duration:0,item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"zbk:guns/pistols/mr6"}},transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0.7f,1.15f,0f],scale:[0.75f,0.75f,0.75f]}}

# Overwrite the placeholder item_model based on the buy-time gun id snapshot.
# REGISTRY — must stay in sync with the canonical gun list at
# combat/weapons/profiles/gun_stats.mcfunction. The /add-weapon skill patches this file
# automatically (templates section 14.5). If you add a weapon by hand, add the matching
# `#pap_gun_id stats matches N` line below or the PaP buy animation will show a plain
# stick for the new weapon.
execute at @s as @e[type=item_display,distance=..3,tag=pap_gun_buyin,limit=1,sort=nearest] if score #pap_gun_id stats matches 7 run data modify entity @s item.components."minecraft:item_model" set value "zbk:guns/wonder_weapons/ray_gun"

# Slide-in animation is now driven by the per-marker pap_anim counter (see on_tick).

# BO3 integration
function zbk:combat/weapons/guns/bo3/registry/display_pap
