# Animated Java Panzer root gameplay glue.
# Rewritten by tools/repair_de_panzer_after_export.js after manual exports.

execute unless entity @s[tag=aj.de_panzer.root] run return 0

# TP to paired Panzer golem by ID while alive.
execute unless entity @s[tag=panzer_dying] if score @s panzer_id matches 1.. run tag @s add panzer_syncing
execute unless entity @s[tag=panzer_dying] if score @s panzer_id matches 1.. run scoreboard players operation #temp_pid panzer_id = @s panzer_id
execute unless entity @s[tag=panzer_dying] if score @s panzer_id matches 1.. as @e[type=minecraft:iron_golem,distance=..16,tag=panzer_ai] if score @s panzer_id = #temp_pid panzer_id at @s rotated as @s run tp @e[type=minecraft:item_display,distance=..16,tag=aj.de_panzer.root,tag=panzer_syncing,limit=1] ~ ~ ~ ~ 0
execute if entity @s[tag=panzer_syncing] run tag @s remove panzer_syncing

execute if entity @s[tag=panzer_landing_to_walk] run scoreboard players remove @s panzer_anim_timer 1
execute if entity @s[tag=panzer_landing_to_walk] if score @s panzer_anim_timer matches ..0 run function zbk:bosses/panzer/model/landing/start_walk_after_landing
execute if entity @s[tag=panzer_landing_to_walk] at @s run function zbk:bosses/panzer/effects/landing_foot_fire

execute if entity @s[tag=aj.de_panzer.animation.animation_model_walk.playing] if score @s aj.animation_model_walk.frame matches 5 at @s run playsound zbk:mob.panzer.footstep hostile @a[distance=..32] ~ ~ ~ 0.85 0.95
execute if entity @s[tag=aj.de_panzer.animation.animation_model_walk.playing] if score @s aj.animation_model_walk.frame matches 17 at @s run playsound zbk:mob.panzer.footstep hostile @a[distance=..32] ~ ~ ~ 0.85 1.05
