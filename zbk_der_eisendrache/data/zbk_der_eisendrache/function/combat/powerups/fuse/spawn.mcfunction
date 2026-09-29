# Context: accepted dropped item at its position; consume it only after creating the pickup.
# World height belongs to summon coordinates; the display transform keeps unit scale.

function zbk:debug/info {f:"DROP",m:"Der Eisendrache Fuse spawned"}

# Preserve the original full-size appearance with a complete valid transform.
summon item_display ~ ~0.5 ~ {Tags:[pickup_item,fuse,de_map_2_only],item:{id:"minecraft:brick",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:powerups/fuse","minecraft:custom_name":'{"text":"Fuse","color":"aqua","italic":false}'}},item_display:"fixed",transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1f,1f,1f]},brightness:{block:15,sky:15}}

# Global state: 0 = available to drop, 2 = currently spawned.
scoreboard players set #global de_fuse 2

# Use the normal drop gate. Pickup reopens the drop for another player.
function zbk:combat/powerups/spawning/record_spawn
kill @s
