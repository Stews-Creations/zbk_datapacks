# ===================================
# START GAME CUTSCENE - TICK
# ===================================
# Moves camera toward end position, finishes when close enough
# ===================================

# Move camera toward end position at configured speed
$execute as @e[type=armor_stand,tag=cutscene_start_camera] at @s facing entity @e[type=marker,tag=cutscene_start_finish,limit=1] feet run tp @s ^ ^ ^$(speed)

# When within 0.5 blocks of end, finish cutscene and start the game
execute as @e[type=armor_stand,tag=cutscene_start_camera] at @s if entity @e[type=marker,tag=cutscene_start_finish,distance=..0.5] run function zombies:map_elements/cutscenes/start_game/finish
