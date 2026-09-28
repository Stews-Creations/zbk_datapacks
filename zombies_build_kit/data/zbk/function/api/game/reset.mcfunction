execute if data storage zbk:events stack[0] run return 0
execute unless score #ready zbk.api matches 1 run return 0
data modify storage zbk:state reason set value "manual"
function zbk:game/initialize
