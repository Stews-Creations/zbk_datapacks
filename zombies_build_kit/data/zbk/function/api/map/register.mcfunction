execute unless data storage zbk:events stack[-1].context{event:"register"} run return 0
$execute if data storage zbk:registry providers[{id:"$(id)"}] run return 0
$data modify storage zbk:registry providers append value {id:"$(id)",version:$(version)}
