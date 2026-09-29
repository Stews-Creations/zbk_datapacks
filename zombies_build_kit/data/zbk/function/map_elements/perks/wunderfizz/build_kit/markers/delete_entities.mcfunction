# Called as/at the selected placement marker.
execute if entity @s[tag=pm_v2] run return run function zbk:map_elements/perks/machines/lifecycle/delete
function zbk:map_elements/perks/machines/legacy/cleanup
# Legacy Wunderfizz UI is centered on this marker; do not touch owned v2 UI.
kill @e[type=text_display,tag=wunderfizz_text_display,tag=!pm_v2_runtime,distance=..0.6]
kill @e[type=text_display,tag=wunderfizz_perk_name,tag=!pm_v2_runtime,distance=..0.6]
kill @e[type=item_display,tag=wunderfizz_display,tag=!pm_v2_runtime,distance=..0.6]
execute positioned ~ ~-1 ~ run kill @e[type=interaction,tag=wunderfizz_interaction,tag=!pm_v2_runtime,distance=..0.2]
function zbk:map_elements/perks/machines/lifecycle/delete_wunderfizz
