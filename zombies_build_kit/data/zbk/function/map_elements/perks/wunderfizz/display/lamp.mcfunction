# Context: selected Wunderfizz marker at its position.
# Powered inactive locations keep the previous no-write behavior; power-off explicitly extinguishes the lamp.

execute if score #power power matches 1 if entity @s[tag=wunderfizz_active_location] run setblock ~ ~1 ~ redstone_lamp[lit=true]
execute if score #power power matches 0 run setblock ~ ~1 ~ redstone_lamp[lit=false]
