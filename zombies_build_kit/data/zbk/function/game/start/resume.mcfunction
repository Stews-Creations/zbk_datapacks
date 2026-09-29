execute if data storage zbk:events stack[0] run return 0
execute unless score #ready zbk.lifecycle matches 1 run return 0
$execute unless data storage zbk:state pending{token:$(token),generation:$(generation),owner:"$(owner)"} run return 0
$execute unless data storage zbk:registry active{id:"$(owner)"} run return 0
execute if score #global game_active matches 1 run return 0
scoreboard players set #resuming zbk.lifecycle 1
function zbk:game/events/before_game_start
scoreboard players set #resuming zbk.lifecycle 0
execute if data storage zbk:events result{blocked:1b} run return 0
data remove storage zbk:state pending
scoreboard players set #continuing zbk.lifecycle 1
function zbk:game/start/match
scoreboard players set #continuing zbk.lifecycle 0
