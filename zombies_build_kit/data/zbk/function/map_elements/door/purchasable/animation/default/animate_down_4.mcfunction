# === ANIMATE DOOR LOWERING - FINAL STAGE ===
# Final stage of door opening
# Called from on_tick when door_anim_timer == 20

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 4: Place door_down_4 template (fully open) based on orientation
execute if entity @s[tag=door_south] run place template minecraft:zombies/door_down_4 ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template minecraft:zombies/door_down_4 ~ ~ ~-1 none
execute if entity @s[tag=door_north] run place template minecraft:zombies/door_down_4 ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template minecraft:zombies/door_down_4 ~ ~ ~1 180

playsound minecraft:block.piston.contract master @a ~ ~ ~ 1 0.7

# Final effects
particle minecraft:cloud ~ ~2 ~ 0.5 1 0.5 0.1 20 force

# Reset timer (animation complete)
scoreboard players reset @s door_anim_timer
