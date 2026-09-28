execute if data storage zbk:events stack[0] run return 0
execute unless score #ready zbk.api matches 1 run return 0
$execute unless data storage zbk:state pending{token:$(token),generation:$(generation),owner:"$(owner)"} run return 0
$execute unless data storage zbk:registry active{id:"$(owner)"} run return 0
execute if score #global game_active matches 1 run return 0
scoreboard players set #resuming zbk.api 1
function zbk:dispatch/before_game_start
scoreboard players set #resuming zbk.api 0
execute if data storage zbk:events result{blocked:1b} run return 0
data remove storage zbk:state pending
scoreboard players set #continuing zbk.api 1
function zombies:game/management/start
scoreboard players set #continuing zbk.api 0
