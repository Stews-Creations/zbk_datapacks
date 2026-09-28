# ===================================
# BARRIER ZOMBIE - BREAK BARRIER
# ===================================
# Purpose: Progress barrier breaking animation and state
#
# Context: Executed as @e[type=marker,tag=barrier,scores={barrier_break_timer=1..}] at @s
# ===================================

# ===== INCREMENT TIMER BY NUMBER OF ZOMBIES =====
# Each zombie adds +1 per tick (1 zombie = 60 ticks, 2 zombies = 30 ticks, etc.)
execute store result score #zombie_count barrier_state run execute if entity @e[type=#minecraft:zombies,distance=..3]
scoreboard players operation @s barrier_break_timer += #zombie_count barrier_state

# ===== BREAK AT 60 TICKS =====
# After 60+ ticks, break one board and reset timer
execute if score @s barrier_break_timer matches 60.. run function zbk:map_elements/barrier/zombie/break_barrier

# ===== PLAY BREAKING SOUNDS =====
# Play periodic breaking sounds while zombies are attacking
# Use ranges to account for timer jumping past exact values with multiple zombies
execute if score @s barrier_break_timer matches 20..25 run playsound minecraft:entity.zombie.attack_wooden_door block @a[distance=..10] ~ ~ ~ 0.5 1.2
execute if score @s barrier_break_timer matches 20..25 run scoreboard players set @s barrier_break_timer 26
execute if score @s barrier_break_timer matches 40..45 run playsound minecraft:entity.zombie.attack_wooden_door block @a[distance=..10] ~ ~ ~ 0.5 1
execute if score @s barrier_break_timer matches 40..45 run scoreboard players set @s barrier_break_timer 46
