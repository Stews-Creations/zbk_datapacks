# ===================================
# BARRIER W3 ZOMBIE - DETECT NEARBY
# ===================================
# Context: Executed as @e[type=marker,tag=barrier_w3] at @s

# If zombies are nearby and barrier is not fully broken, activate timer
execute if score @s bw3_state matches ..5 if entity @e[type=#minecraft:zombies,distance=..3] if score @s bw3_break_timer matches ..0 run scoreboard players set @s bw3_break_timer 1

# If no zombies nearby and timer is active, reset it
execute unless entity @e[type=#minecraft:zombies,distance=..3] if score @s bw3_break_timer matches 1.. run scoreboard players set @s bw3_break_timer 0
