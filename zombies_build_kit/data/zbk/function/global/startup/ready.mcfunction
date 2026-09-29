data modify storage zbk:registry providers set value []
data remove storage zbk:registry active
function zbk:global/startup/events/register
execute store result score #providers zbk.lifecycle run data get storage zbk:registry providers
execute if score #providers zbk.lifecycle matches 1 if data storage zbk:registry providers[{version:30000}] run data modify storage zbk:registry active set from storage zbk:registry providers[0]
execute if score #providers zbk.lifecycle matches 2.. run tellraw @a {text:"[ZBK] Multiple map packs installed. Map runtime disabled; install one map provider.",color:"red"}
execute if score #providers zbk.lifecycle matches 1 unless data storage zbk:registry active run tellraw @a {text:"[ZBK] Map pack requires a different base pack compatibility revision.",color:"red"}
scoreboard players set #ready zbk.lifecycle 1
function zbk:global/startup/events/ready
