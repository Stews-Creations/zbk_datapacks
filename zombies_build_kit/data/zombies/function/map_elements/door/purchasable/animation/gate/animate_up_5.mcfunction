# === ANIMATE GATE DOOR RISING - FINAL STAGE ===
# Final stage of gate door opening
# Called from on_tick when door_anim_timer == 25

# Early return if not purchased
execute unless entity @s[tag=purchased] run return 0

# Stage 5: Place gate_door_up_5 template (fully open) based on orientation
execute if entity @s[tag=door_south] run place template minecraft:zombies/gate_door_up_5 ~-3 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west] run place template minecraft:zombies/gate_door_up_5 ~ ~ ~-3 none
execute if entity @s[tag=door_north] run place template minecraft:zombies/gate_door_up_5 ~3 ~ ~ clockwise_90
execute if entity @s[tag=door_east] run place template minecraft:zombies/gate_door_up_5 ~ ~ ~3 180

playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 0.6

# Final effects
particle minecraft:cloud ~ ~2 ~ 0.5 1 0.5 0.1 20 force

# Reset timer (animation complete)
scoreboard players reset @s door_anim_timer
