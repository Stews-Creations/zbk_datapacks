# === ANIMATE DOOR LOWERING - STAGE 3 ===
# Continues lowering the door
# Called from on_tick when door_anim_timer == 15

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 3: Place door_down_3 template based on orientation
execute if entity @s[tag=door_south] run place template zbk:doors/door_down_3 ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template zbk:doors/door_down_3 ~ ~ ~-1 none
execute if entity @s[tag=door_north] run place template zbk:doors/door_down_3 ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template zbk:doors/door_down_3 ~ ~ ~1 180

playsound minecraft:block.piston.contract master @a ~ ~ ~ 1 0.8
