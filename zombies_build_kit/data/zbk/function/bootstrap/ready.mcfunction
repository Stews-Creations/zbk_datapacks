data modify storage zbk:registry providers set value []
data remove storage zbk:registry active
function zbk:dispatch/register
execute store result score #providers zbk.api run data get storage zbk:registry providers
execute if score #providers zbk.api matches 1 if data storage zbk:registry providers[{version:10000}] run data modify storage zbk:registry active set from storage zbk:registry providers[0]
execute if score #providers zbk.api matches 2.. run tellraw @a {text:"[ZBK] Multiple map packs installed. Map runtime disabled; install one map provider.",color:"red"}
execute if score #providers zbk.api matches 1 unless data storage zbk:registry active run tellraw @a {text:"[ZBK] Map pack requires a different Core API version.",color:"red"}
scoreboard players set #ready zbk.api 1
function zbk:dispatch/core_ready
