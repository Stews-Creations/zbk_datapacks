# Opt-in conversion, called as/at a saved marker tagged pm_v2_upgrade.
# The marker UUID and saved playerYaw remain authoritative.
execute unless score @s playerYaw matches -180..180 run return fail
function zbk:map_elements/perks/machines/legacy/cleanup
execute if entity @s[tag=wunderfizz] run kill @e[type=text_display,tag=wunderfizz_text_display,tag=!pm_v2_runtime,distance=..0.6]
execute if entity @s[tag=wunderfizz] run kill @e[type=text_display,tag=wunderfizz_perk_name,tag=!pm_v2_runtime,distance=..0.6]
execute if entity @s[tag=wunderfizz] run kill @e[type=item_display,tag=wunderfizz_display,tag=!pm_v2_runtime,distance=..0.6]
execute if entity @s[tag=wunderfizz] positioned ~ ~-1 ~ run kill @e[type=interaction,tag=wunderfizz_interaction,tag=!pm_v2_runtime,distance=..0.2]
execute align xyz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~
execute if score @s playerYaw matches -45..45 run data merge entity @s {Rotation:[0f,0f]}
execute if score @s playerYaw matches 46..135 run data merge entity @s {Rotation:[90f,0f]}
execute if score @s playerYaw matches 136..180 run data merge entity @s {Rotation:[180f,0f]}
execute if score @s playerYaw matches -180..-136 run data merge entity @s {Rotation:[180f,0f]}
execute if score @s playerYaw matches -135..-46 run data merge entity @s {Rotation:[-90f,0f]}
tag @s add pm_v2
tag @s remove perk_machine_legacy
tag @s remove wunderfizz_ui_spawned
tag @s remove pm_v2_ready
tag @s remove pm_v2_upgrade
