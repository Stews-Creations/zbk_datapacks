# ===================================
# END GAME CUTSCENE - TICK TIMED
# ===================================
# Counts down timer, shows milestones, finishes when done
# ===================================

# Decrement timer
scoreboard players remove #global cutscene_timer 1

# === At 50% remaining - Show "Game Over" title ===
execute if score #global cutscene_timer matches 1.. as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_title] run title @a times 10 70 20
execute if score #global cutscene_timer matches 1.. as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_title] run title @a title {"text":"GAME OVER","color":"dark_red","bold":true}
execute if score #global cutscene_timer matches 1.. as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_title] run title @a subtitle ["",{"text":"Rounds Survived ","color":"red"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"}]
execute if score #global cutscene_timer matches 1.. as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_title] run tag @s add cs_showed_title

# === At 2 seconds remaining - Show combat record dialog ===
execute if score #global cutscene_timer matches ..40 as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_dialog] run execute as @a run function zombies:player/stats/dialog/show
execute if score #global cutscene_timer matches ..40 as @e[type=armor_stand,tag=cutscene_camera,tag=!cs_showed_dialog] run tag @s add cs_showed_dialog

# === Timer expired - Finish cutscene ===
execute if score #global cutscene_timer matches ..0 run function zombies:map_elements/cutscenes/end_game/finish
