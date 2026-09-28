# One player-range query per prompt; write text and state only on transitions.
execute store success score #rs_near temp if entity @a[distance=..2.25]
execute if score @s rs_prompt = #rs_near temp run return 0
execute if score #rs_near temp matches 1 run data modify entity @s text set value {text:"Right click\nto pickup",color:"yellow"}
execute if score #rs_near temp matches 0 run data modify entity @s text set value ""
scoreboard players operation @s rs_prompt = #rs_near temp
