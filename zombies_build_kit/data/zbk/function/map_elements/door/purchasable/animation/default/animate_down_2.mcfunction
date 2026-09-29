# === ANIMATE DOOR LOWERING - STAGE 2 ===
# Continues lowering the door
# Called from on_tick when door_anim_timer == 10

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 2: Place door_down_2 template based on orientation
execute if entity @s[tag=door_south] run place template zbk:doors/door_down_2 ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template zbk:doors/door_down_2 ~ ~ ~-1 none
execute if entity @s[tag=door_north] run place template zbk:doors/door_down_2 ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template zbk:doors/door_down_2 ~ ~ ~1 180

playsound minecraft:block.piston.contract master @a ~ ~ ~ 1 0.9
