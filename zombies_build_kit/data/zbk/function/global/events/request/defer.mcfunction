# Called inside before_game_start with {owner}; claim an intro for the active provider.
execute unless data storage zbk:events stack[-1].context{event:"game/before_game_start",request:1b,resuming:0,skip_cutscene:0} run return 0
$execute unless data storage zbk:registry active{id:"$(owner)"} run return 0
execute if data storage zbk:events stack[-1].context{claims:1} run return run function zbk:global/events/request/block
data modify storage zbk:events stack[-1].context.claims set value 1
$data modify storage zbk:events stack[-1].context.owner set value "$(owner)"
