# Force all players to spectator mode watching the camera (delayed 1 tick)
gamemode spectator @a[tag=!disable_tp]
execute as @a[tag=!disable_tp] run spectate @e[type=armor_stand,tag=cutscene_camera,limit=1]
