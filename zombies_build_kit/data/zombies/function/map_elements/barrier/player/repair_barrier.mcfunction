# Refresh the repair prompt when state reaches fully repaired, before rebuilding boards.
# This transition replaces repeated idle display writes; repair rewards retain their original order.

# ===================================
# BARRIER PLAYER - REPAIR BARRIER
# ===================================
# Purpose: Handle barrier repair with point limit logic
#
# Context: Executed as @a (player doing repair), positioned at barrier marker
# ===================================

# ===== GET NEAREST DAMAGED BARRIER =====
# Store barrier marker in variable for manipulation
tag @e[type=marker,tag=barrier,distance=..2,scores={barrier_state=1..},limit=1,sort=nearest] add barrier_repairing

# ===== REPAIR ONE STAGE =====
# Decrease barrier state by 1 (repair one level)
scoreboard players remove @e[type=marker,tag=barrier_repairing] barrier_state 1
execute as @e[type=marker,tag=barrier_repairing,scores={barrier_state=0}] at @s run function zombies:map_elements/barrier/management/update_repair_text

# Reset break timer
scoreboard players set @e[type=marker,tag=barrier_repairing] barrier_break_timer -1

# ===== REPAIR PASSENGER/PARENT =====
# Call the passenger repair function to handle entity restoration and sounds
execute as @e[type=marker,tag=barrier_repairing] at @s run function zombies:map_elements/barrier/player/repair_passenger

# ===== CALCULATE POINT LIMIT =====
# Store round number in temp scoreboard
execute as @s run function zbk:dispatch/voice_event_rebuild_barrier
scoreboard players operation #temp barrier_state = #global wave.round
# Multiply by 5 to get limit
scoreboard players set #five barrier_state 5
scoreboard players operation #temp barrier_state *= #five barrier_state

# ===== DEBUG: Show point calculation =====
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barrier Debug] ","color":"gold"},{"text":"Round: ","color":"white"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"},{"text":" | Limit: ","color":"white"},{"score":{"name":"#temp","objective":"barrier_state"},"color":"yellow"},{"text":" | Your Repairs: ","color":"white"},{"score":{"name":"@s","objective":"barrier_point_repairs"},"color":"yellow"}]

# ===== AWARD POINTS IF UNDER LIMIT =====
# Check if player is under their personal point limit
execute if score @s barrier_point_repairs < #temp barrier_state run scoreboard players add @s player_points 10
execute if score @s barrier_point_repairs < #temp barrier_state run scoreboard players add @s barrier_point_repairs 1
execute if score @s barrier_point_repairs < #temp barrier_state run function zombies:sounds/play/cash
execute if score @s barrier_point_repairs < #temp barrier_state run title @s actionbar [{"text":"Barrier Repaired! +10 Points","color":"green"}]
execute if score @s barrier_point_repairs < #temp barrier_state if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barrier Debug] ","color":"gold"},{"text":"Points awarded! New total repairs: ","color":"green"},{"score":{"name":"@s","objective":"barrier_point_repairs"},"color":"yellow"}]

# ===== NO POINTS IF AT/OVER LIMIT =====
# If player is at or over limit, show different message and play a subtle wood sound instead of cash
execute if score @s barrier_point_repairs >= #temp barrier_state run playsound minecraft:block.wood.hit master @s ~ ~ ~ 1 0.8
execute if score @s barrier_point_repairs >= #temp barrier_state run title @s actionbar [{"text":"Barrier Repaired (No Points - Limit Reached)","color":"yellow"}]
execute if score @s barrier_point_repairs >= #temp barrier_state if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barrier Debug] ","color":"gold"},{"text":"No points - at limit","color":"red"}]

# ===== SET REPAIR COOLDOWN =====
# Set 1 second cooldown (20 ticks) before player can repair again
scoreboard players set @s barrier_repair_cooldown 20

# ===== CLEAN UP TAGS =====
tag @e[type=marker,tag=barrier_repairing] remove barrier_repairing
