execute unless data storage zbk:state reason run data modify storage zbk:state reason set value "manual"
execute if score #global game_active matches 1 if score #ready zbk.lifecycle matches 1 run function zbk:game/events/game_end
data modify storage zbk:registry zones set value [{zone:0}]
tag @e[tag=zbk.round_blocker] remove zbk.round_blocker
scoreboard players add #generation zbk.lifecycle 1
data remove storage zbk:state pending
execute if score #ready zbk.lifecycle matches 1 run function zbk:game/events/before_game_reset
