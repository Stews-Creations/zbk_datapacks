# ===================================
# UPDATE MONKEY BOMB POSITION
# ===================================
# Moves the monkey bomb marker with a slower, heavier arc.

# Store 1/5 of velocity to storage for sub-steps.
execute store result storage zbk:temp motion.x double 0.00002 run scoreboard players get @s motion_x1
execute store result storage zbk:temp motion.y double 0.00002 run scoreboard players get @s motion_y1
execute store result storage zbk:temp motion.z double 0.00002 run scoreboard players get @s motion_z1

scoreboard players set @s grenade_sub_step 5
function zbk:combat/weapons/special_equipment/monkey_bomb/physics/sub_step

# Update linked display position to the marker.
scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute at @s as @e[type=item_display,tag=monkey_bomb_display] if score @s grenade_id = #current_grenade_id grenade_id run tp @s ~ ~0.5 ~ ~ ~
execute if entity @s[tag=monkey_bomb_landed] at @s as @e[type=item_display,tag=monkey_bomb_display] if score @s grenade_id = #current_grenade_id grenade_id run tag @s add monkey_bomb_landed

# Stop applying gravity once it has landed.
execute if entity @s[tag=monkey_bomb_landed] run return fail

# Stronger gravity than grenades so the heavier monkey bomb drops sooner.
scoreboard players remove @s motion_y1 700
