execute if data storage zbk:events stack[0] run return 0
execute unless score #ready zbk.lifecycle matches 1 run return 0
execute if score #global game_active matches 1 run return 0
execute if data storage zbk:state pending run return 0
scoreboard players set #skip_cutscene zbk.lifecycle 1
scoreboard players set #resuming zbk.lifecycle 0
function zbk:game/events/before_game_start
execute if data storage zbk:events result{blocked:1b} run return 0
execute if data storage zbk:events result{claims:1} run return run function zbk:game/start/accept_deferral
function zbk:game/start/continue_immediate
