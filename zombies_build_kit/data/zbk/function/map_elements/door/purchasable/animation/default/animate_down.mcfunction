# === ANIMATE DOOR LOWERING - STAGE 1 ===
# Uses preset templates for door animation with correct orientation
# Marker is at the middle of the bottom row
# Called from on_tick when door_anim_timer == 5

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 1: Place door_down_1 template based on orientation
execute if entity @s[tag=door_south] run place template zbk:doors/door_down_1 ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template zbk:doors/door_down_1 ~ ~ ~-1 none
execute if entity @s[tag=door_north] run place template zbk:doors/door_down_1 ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template zbk:doors/door_down_1 ~ ~ ~1 180

# Play sound
playsound minecraft:block.piston.contract master @a ~ ~ ~ 1 1
