# Summon the Animated Java Panzer rig for the current Panzer controller.
# Runs as and at: the Panzer controller entity
# Requires exported Animated Java namespace: de_panzer

scoreboard players add #panzer_id_counter panzer_id 1
scoreboard players operation @s panzer_id = #panzer_id_counter panzer_id

function animated_java:de_panzer/summon {args: {animation: 'animation_model_landing', start_animation: true}}
playsound zbk:mob.panzer.landing_flame hostile @a[distance=..48] ~ ~ ~ 0.8 1

execute as @e[type=item_display,distance=..1,tag=aj.de_panzer.root,sort=nearest,limit=1] run tag @s add panzer_model
execute as @e[type=item_display,distance=..1,tag=aj.de_panzer.root,sort=nearest,limit=1] run scoreboard players operation @s panzer_id = #panzer_id_counter panzer_id
execute as @e[type=item_display,distance=..1,tag=aj.de_panzer.root,sort=nearest,limit=1] run tag @s add panzer_landing_to_walk
execute as @e[type=item_display,distance=..1,tag=aj.de_panzer.root,sort=nearest,limit=1] run scoreboard players set @s panzer_anim_timer 49

# Ensure Panzer display entities render after temporary debug hiding.
execute as @e[type=item_display,distance=..1,tag=aj.de_panzer.entity] run data modify entity @s view_range set value 1f
