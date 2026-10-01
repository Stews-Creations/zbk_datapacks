# Attach after the initial 5-tick sync delay, then restore the camera every tick.
execute unless score #global cutscene_active matches 2 unless score #global cutscene_active matches 4 run return 0
execute unless entity @e[type=armor_stand,tag=cutscene_start_camera] run return 0
gamemode spectator @a[tag=!disable_tp,gamemode=!spectator]
execute as @a[tag=!disable_tp] run spectate @e[type=armor_stand,tag=cutscene_start_camera,limit=1]
schedule function zbk:map_elements/cutscenes/start_game/camera/spectate 1t replace
