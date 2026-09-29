# Complete - Dragon head has collected enough souls
# Run as the dragon head entity

# Set mode to 3 (complete)
scoreboard players set @s dragon_head_mode 3

# Play ender dragon death sound
execute at @s run playsound zbk_der_eisendrache:dragon.dragonhead_despawn master @a ~ ~ ~ 0.25 1

# Shoot stone block particles outward
execute at @s run particle minecraft:block{block_state:"minecraft:stone"} ~ ~1 ~ 1 1 1 0.5 100 force
execute at @s run particle minecraft:block{block_state:"minecraft:stone"} ~ ~1 ~ 0.5 0.5 0.5 1 50 force

# Create dramatic explosion effect
execute at @s run particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0 5 force

# Set visibility to 0 (make invisible by setting view_range to 0)
data merge entity @s {view_range:0.0f}

function zbk:debug/event {f:"QUEST",m:"A dragon head has been completed!"}
