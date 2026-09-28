# === DELETE PERK MACHINE ENTITIES ===
# Called as/at the perk_machine marker. Places empty template to clear blocks,
# then kills all associated entities and the marker.

# === PLACE EMPTY STRUCTURE (JUGGERNOG) ===
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches -45..45 run place template minecraft:zombies/juggernog_empty ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches 45..135 run place template minecraft:zombies/juggernog_empty ~ ~ ~-1 none
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches 135..180 run place template minecraft:zombies/juggernog_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches -180..-135 run place template minecraft:zombies/juggernog_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches -135..-45 run place template minecraft:zombies/juggernog_empty ~ ~ ~1 180

# === PLACE EMPTY STRUCTURE (SPEED COLA) ===
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches -45..45 run place template minecraft:zombies/speed_cola_empty ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches 45..135 run place template minecraft:zombies/speed_cola_empty ~ ~ ~-1 none
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches 135..180 run place template minecraft:zombies/speed_cola_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches -180..-135 run place template minecraft:zombies/speed_cola_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches -135..-45 run place template minecraft:zombies/speed_cola_empty ~ ~ ~1 180

# === PLACE EMPTY STRUCTURE (DOUBLE TAP) ===
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches -45..45 run place template minecraft:zombies/double_tap_empty ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches 45..135 run place template minecraft:zombies/double_tap_empty ~ ~ ~-1 none
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches 135..180 run place template minecraft:zombies/double_tap_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches -180..-135 run place template minecraft:zombies/double_tap_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches -135..-45 run place template minecraft:zombies/double_tap_empty ~ ~ ~1 180

# === PLACE EMPTY STRUCTURE (STAMINA UP) ===
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches -45..45 run place template minecraft:zombies/stamina_up_empty ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches 45..135 run place template minecraft:zombies/stamina_up_empty ~ ~ ~-1 none
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches 135..180 run place template minecraft:zombies/stamina_up_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches -180..-135 run place template minecraft:zombies/stamina_up_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches -135..-45 run place template minecraft:zombies/stamina_up_empty ~ ~ ~1 180

# === PLACE EMPTY STRUCTURE (QUICK REVIVE) ===
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches -45..45 run place template minecraft:zombies/quick_revive_empty ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches 45..135 run place template minecraft:zombies/quick_revive_empty ~ ~ ~-1 none
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches 135..180 run place template minecraft:zombies/quick_revive_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches -180..-135 run place template minecraft:zombies/quick_revive_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches -135..-45 run place template minecraft:zombies/quick_revive_empty ~ ~ ~1 180

# === PLACE EMPTY STRUCTURE (MULE KICK) ===
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches -45..45 run place template minecraft:zombies/mule_kick_empty ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches 45..135 run place template minecraft:zombies/mule_kick_empty ~ ~ ~-1 none
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches 135..180 run place template minecraft:zombies/mule_kick_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches -180..-135 run place template minecraft:zombies/mule_kick_empty ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches -135..-45 run place template minecraft:zombies/mule_kick_empty ~ ~ ~1 180

# Kill text display inside
kill @e[type=text_display,distance=..5]

# Kill nearby perk bonus marker
kill @e[type=marker,tag=perk_bonus,distance=..5]

# Kill self (marker)
kill @s
