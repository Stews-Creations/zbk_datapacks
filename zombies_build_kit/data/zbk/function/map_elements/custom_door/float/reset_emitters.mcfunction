# === CUSTOM DOOR FLOAT - RESET EMITTERS ===
# Clears saved float particle centers and rebuilds one emitter per enabled floating door.

kill @e[type=marker,tag=cd_float_center]

execute as @e[type=marker,tag=custom_door_1,scores={custom_door_float=1}] at @s run function zbk:map_elements/custom_door/float/setup
