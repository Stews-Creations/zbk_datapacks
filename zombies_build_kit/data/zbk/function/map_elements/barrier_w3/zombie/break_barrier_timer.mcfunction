# ===================================
# BARRIER W3 ZOMBIE - BREAK BARRIER TIMER
# ===================================
# Context: Executed as @e[type=marker,tag=barrier_w3,scores={bw3_break_timer=1..}] at @s

# ===== INCREMENT TIMER BY NUMBER OF ZOMBIES =====
execute store result score #zombie_count bw3_state run execute if entity @e[type=#minecraft:zombies,distance=..3]
scoreboard players operation @s bw3_break_timer += #zombie_count bw3_state

# ===== BREAK AT 60 TICKS =====
execute if score @s bw3_break_timer matches 60.. run function zbk:map_elements/barrier_w3/zombie/break_barrier

# ===== PLAY BREAKING SOUNDS =====
execute if score @s bw3_break_timer matches 20..25 run playsound minecraft:entity.zombie.attack_wooden_door block @a[distance=..10] ~ ~ ~ 0.5 1.2
execute if score @s bw3_break_timer matches 20..25 run scoreboard players set @s bw3_break_timer 26
execute if score @s bw3_break_timer matches 40..45 run playsound minecraft:entity.zombie.attack_wooden_door block @a[distance=..10] ~ ~ ~ 0.5 1
execute if score @s bw3_break_timer matches 40..45 run scoreboard players set @s bw3_break_timer 46
