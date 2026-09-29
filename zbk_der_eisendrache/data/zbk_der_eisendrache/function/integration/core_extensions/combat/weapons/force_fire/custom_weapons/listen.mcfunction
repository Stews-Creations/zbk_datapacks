execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:integration/core_extensions/combat/weapons/force_fire/1/listen
execute if data storage zbk:events stack[-1].context{handled:1b} run return 0
function zbk_der_eisendrache:integration/core_extensions/combat/weapons/force_fire/2/listen
execute if data storage zbk:events stack[-1].context{handled:1b} run return 0
