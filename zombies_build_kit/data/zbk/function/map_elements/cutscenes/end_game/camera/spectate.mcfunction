# Attach after the initial 5-tick sync delay, then restore the camera every tick.
execute unless score #global cutscene_active matches 1 unless score #global cutscene_active matches 3 run return 0
execute unless entity @e[type=armor_stand,tag=cutscene_camera,tag=!cutscene_start_camera,tag=!intro_cutscene] run return 0
gamemode spectator @a[tag=!disable_tp,gamemode=!spectator]
execute as @a[tag=!disable_tp] run spectate @e[type=armor_stand,tag=cutscene_camera,tag=!cutscene_start_camera,tag=!intro_cutscene,limit=1]
schedule function zbk:map_elements/cutscenes/end_game/camera/spectate 1t replace
