scoreboard objectives add zbk.lifecycle dummy
scoreboard players set #ready zbk.lifecycle 0
scoreboard players set #resuming zbk.lifecycle 0
scoreboard players set #continuing zbk.lifecycle 0
scoreboard players set #ending zbk.lifecycle 0
scoreboard players add #generation zbk.lifecycle 1
scoreboard players add #token zbk.lifecycle 0
data modify storage zbk:events stack set value []
data modify storage zbk:state zone_calls set value []
data modify storage zbk:registry zones set value [{zone:0}]
data modify storage zbk:registry providers set value []
data remove storage zbk:registry active
data remove storage zbk:state pending
data modify storage zbk:state reason set value "load"
schedule function zbk:global/startup/ready 1t replace
