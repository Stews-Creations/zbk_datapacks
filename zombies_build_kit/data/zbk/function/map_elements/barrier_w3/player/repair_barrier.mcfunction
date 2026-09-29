# ===================================
# BARRIER W3 PLAYER - REPAIR BARRIER
# ===================================
# Context: Executed as @a (player doing repair), positioned at barrier_w3 marker

# ===== GET NEAREST DAMAGED BARRIER =====
tag @e[type=marker,tag=barrier_w3,distance=..2,scores={bw3_state=1..},limit=1,sort=nearest] add barrier_w3_repairing

# ===== REPAIR ONE STAGE =====
scoreboard players remove @e[type=marker,tag=barrier_w3_repairing] bw3_state 1
scoreboard players set @e[type=marker,tag=barrier_w3_repairing] bw3_break_timer -1

# ===== REPAIR PASSENGER/PARENT =====
execute as @e[type=marker,tag=barrier_w3_repairing] at @s run function zbk:map_elements/barrier_w3/player/repair_passenger

# ===== CALCULATE POINT LIMIT =====
execute as @s run function zbk:map_elements/barrier/events/voice_event_rebuild_barrier
scoreboard players operation #temp bw3_state = #global wave.round
scoreboard players set #five bw3_state 5
scoreboard players operation #temp bw3_state *= #five bw3_state

# ===== DEBUG =====
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barrier W3 Debug] ","color":"gold"},{"text":"Round: ","color":"white"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"},{"text":" | Limit: ","color":"white"},{"score":{"name":"#temp","objective":"bw3_state"},"color":"yellow"},{"text":" | Your Repairs: ","color":"white"},{"score":{"name":"@s","objective":"barrier_point_repairs"},"color":"yellow"}]

# ===== AWARD POINTS IF UNDER LIMIT =====
execute if score @s barrier_point_repairs < #temp bw3_state run scoreboard players add @s player_points 10
execute if score @s barrier_point_repairs < #temp bw3_state run scoreboard players add @s barrier_point_repairs 1
execute if score @s barrier_point_repairs < #temp bw3_state run function zbk:player/points/audio/cash
execute if score @s barrier_point_repairs < #temp bw3_state run title @s actionbar [{"text":"Barrier Repaired! +10 Points","color":"green"}]

# ===== NO POINTS IF AT/OVER LIMIT =====
execute if score @s barrier_point_repairs >= #temp bw3_state run playsound minecraft:block.wood.hit master @s ~ ~ ~ 1 0.8
execute if score @s barrier_point_repairs >= #temp bw3_state run title @s actionbar [{"text":"Barrier Repaired (No Points - Limit Reached)","color":"yellow"}]

# ===== SET REPAIR COOLDOWN =====
scoreboard players set @s barrier_repair_cooldown 20

# ===== CLEAN UP TAGS =====
tag @e[type=marker,tag=barrier_w3_repairing] remove barrier_w3_repairing
