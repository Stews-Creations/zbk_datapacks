# Movement, title, dialog, and completion remain separate passes over all cameras.
# Combining all milestones per camera would change cross-camera ordering.

# ===================================
# END GAME CUTSCENE - TICK
# ===================================
# Purpose: Per-tick camera movement and milestone checks
# Runs every tick while cutscene_active = 1
# ===================================

# Move camera toward end position at configured speed
$execute as @e[type=armor_stand,tag=cutscene_camera] at @s facing entity @e[type=marker,tag=cutscene_end_finish,limit=1] feet run tp @s ^ ^ ^$(speed)

# === Milestone: 7 blocks from end - Show "Game Over" title ===
execute as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_title] at @s if entity @e[type=marker,tag=cutscene_end_finish,distance=..7] run function zbk:map_elements/cutscenes/end_game/show_title

# === Milestone: 1 block from end - Show combat record dialog ===
execute as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_dialog] at @s if entity @e[type=marker,tag=cutscene_end_finish,distance=..1] run function zbk:map_elements/cutscenes/end_game/show_dialog

# === Milestone: 0.5 blocks from end - Finish cutscene ===
execute as @e[type=armor_stand,tag=cutscene_camera] at @s if entity @e[type=marker,tag=cutscene_end_finish,distance=..0.5] run function zbk:map_elements/cutscenes/end_game/finish
