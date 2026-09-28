execute unless data storage zbk:state reason run data modify storage zbk:state reason set value "manual"
execute if score #global game_active matches 1 if score #ready zbk.api matches 1 run function zbk:dispatch/game_end
data modify storage zbk:registry zones set value [{zone:0}]
tag @e[tag=zbk.round_blocker] remove zbk.round_blocker
scoreboard players add #generation zbk.api 1
data remove storage zbk:state pending
execute if score #ready zbk.api matches 1 run function zbk:dispatch/before_game_reset
