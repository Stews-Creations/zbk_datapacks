# ===================================
# BARRIER ZOMBIE - DETECT NEARBY
# ===================================
# Purpose: Detect zombies near barriers and start break timer
#
# Context: Executed as @e[type=marker,tag=barrier] at @s
# ===================================

# ===== CHECK FOR NEARBY ZOMBIES =====
# If zombies are nearby and barrier is not fully broken, activate timer
# Only activate if barrier is not fully broken (state < 6)
execute if score @s barrier_state matches ..5 if entity @e[type=#minecraft:zombies,distance=..3] if score @s barrier_break_timer matches ..0 run scoreboard players set @s barrier_break_timer 1

# ===== RESET TIMER IF NO ZOMBIES =====
# If no zombies nearby and timer is active, reset it to inactive
execute unless entity @e[type=#minecraft:zombies,distance=..3] if score @s barrier_break_timer matches 1.. run scoreboard players set @s barrier_break_timer 0
