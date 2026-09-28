# === ANIMATE GATE DOOR RISING - STAGE 2 ===
# Continues raising the gate door
# Called from on_tick when door_anim_timer == 10

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 2: Place gate_door_up_2 template based on orientation
execute if entity @s[tag=door_south] run place template minecraft:zombies/gate_door_up_2 ~-3 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template minecraft:zombies/gate_door_up_2 ~ ~ ~-3 none
execute if entity @s[tag=door_north] run place template minecraft:zombies/gate_door_up_2 ~3 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template minecraft:zombies/gate_door_up_2 ~ ~ ~3 180

playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 0.9
