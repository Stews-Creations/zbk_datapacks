# === ANIMATE GATE DOOR RISING - STAGE 1 ===
# Uses preset templates for gate door animation with correct orientation
# Marker is at the middle of the bottom row
# Called from on_tick when door_anim_timer == 5

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 1: Place gate_door_up_1 template based on orientation
execute if entity @s[tag=door_south] run place template minecraft:zombies/gate_door_up_1 ~-3 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template minecraft:zombies/gate_door_up_1 ~ ~ ~-3 none
execute if entity @s[tag=door_north] run place template minecraft:zombies/gate_door_up_1 ~3 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template minecraft:zombies/gate_door_up_1 ~ ~ ~3 180

# Play sound
playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 1
