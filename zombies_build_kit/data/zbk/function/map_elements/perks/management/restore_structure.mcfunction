function zbk:map_elements/perks/machines/legacy/cleanup
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches -45..45 run place template zbk:perks/juggernog ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches 45..135 run place template zbk:perks/juggernog ~ ~ ~-1 none
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches 135..180 run place template zbk:perks/juggernog ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches -180..-135 run place template zbk:perks/juggernog ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_juggernog] if score @s playerYaw matches -135..-45 run place template zbk:perks/juggernog ~ ~ ~1 180
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches -45..45 run place template zbk:perks/stamina_up ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches 45..135 run place template zbk:perks/stamina_up ~ ~ ~-1 none
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches 135..180 run place template zbk:perks/stamina_up ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches -180..-135 run place template zbk:perks/stamina_up ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_stamina_up] if score @s playerYaw matches -135..-45 run place template zbk:perks/stamina_up ~ ~ ~1 180
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches -45..45 run place template zbk:perks/speed_cola ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches 45..135 run place template zbk:perks/speed_cola ~ ~ ~-1 none
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches 135..180 run place template zbk:perks/speed_cola ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches -180..-135 run place template zbk:perks/speed_cola ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_speed_cola] if score @s playerYaw matches -135..-45 run place template zbk:perks/speed_cola ~ ~ ~1 180
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches -45..45 run place template zbk:perks/double_tap ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches 45..135 run place template zbk:perks/double_tap ~ ~ ~-1 none
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches 135..180 run place template zbk:perks/double_tap ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches -180..-135 run place template zbk:perks/double_tap ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_double_tap] if score @s playerYaw matches -135..-45 run place template zbk:perks/double_tap ~ ~ ~1 180
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches -45..45 run place template zbk:perks/quick_revive ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches 45..135 run place template zbk:perks/quick_revive ~ ~ ~-1 none
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches 135..180 run place template zbk:perks/quick_revive ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches -180..-135 run place template zbk:perks/quick_revive ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_quick_revive] if score @s playerYaw matches -135..-45 run place template zbk:perks/quick_revive ~ ~ ~1 180
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches -45..45 run place template zbk:perks/mule_kick ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches 45..135 run place template zbk:perks/mule_kick ~ ~ ~-1 none
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches 135..180 run place template zbk:perks/mule_kick ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches -180..-135 run place template zbk:perks/mule_kick ~1 ~ ~ clockwise_90
execute if entity @s[tag=perk_mule_kick] if score @s playerYaw matches -135..-45 run place template zbk:perks/mule_kick ~ ~ ~1 180
execute if entity @s[tag=wunderfizz] if score @s playerYaw matches -45..45 run place template zbk:perks/wunderfizz ~-1 ~-2 ~ counterclockwise_90
execute if entity @s[tag=wunderfizz] if score @s playerYaw matches 45..135 run place template zbk:perks/wunderfizz ~ ~-2 ~-1 none
execute if entity @s[tag=wunderfizz] if score @s playerYaw matches 135..180 run place template zbk:perks/wunderfizz ~1 ~-2 ~ clockwise_90
execute if entity @s[tag=wunderfizz] if score @s playerYaw matches -180..-135 run place template zbk:perks/wunderfizz ~1 ~-2 ~ clockwise_90
execute if entity @s[tag=wunderfizz] if score @s playerYaw matches -135..-45 run place template zbk:perks/wunderfizz ~ ~-2 ~1 180
execute if entity @s[tag=wunderfizz] run scoreboard players operation @e[type=marker,tag=wunderfizz,tag=!pm_marker,distance=..3,sort=nearest,limit=1] playerYaw = @s playerYaw
execute if entity @s[tag=wunderfizz] run return run kill @s
tag @s remove pm_marker
tag @s remove pm_native
tag @s remove pm_ready
