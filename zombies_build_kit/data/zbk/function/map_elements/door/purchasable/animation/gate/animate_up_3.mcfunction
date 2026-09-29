# === ANIMATE GATE DOOR RISING - STAGE 3 ===
# Continues raising the gate door
# Called from on_tick when door_anim_timer == 15

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 3: Place gate_door_up_3 template based on orientation
execute if entity @s[tag=door_south] run place template zbk:doors/gate_door_up_3 ~-3 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template zbk:doors/gate_door_up_3 ~ ~ ~-3 none
execute if entity @s[tag=door_north] run place template zbk:doors/gate_door_up_3 ~3 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template zbk:doors/gate_door_up_3 ~ ~ ~3 180

playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 0.8
