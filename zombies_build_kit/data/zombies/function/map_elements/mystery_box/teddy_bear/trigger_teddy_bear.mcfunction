# Trigger teddy bear animation
# Interrupts the current buy animation and starts the teddy bear animation

# Reset spin counter for the location that triggered teddy bear
execute as @e[tag=mystery_box_location,type=marker,distance=..10,limit=1,sort=nearest] run scoreboard players set @s mystery_box_spins 0

# Check if mystery box locations are unlocked yet
# If not unlocked (first teddy bear), unlock all locations
execute if score #mystery_box_unlocked mystery_box_unlocked matches 0 as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[Mystery Box] ","color":"aqua"},{"text":"All mystery box locations unlocked!","color":"green","bold":true}]
execute if score #mystery_box_unlocked mystery_box_unlocked matches 0 run scoreboard players set #mystery_box_unlocked mystery_box_unlocked 1

# Log teddy bear trigger
# Stop the gun cycling by removing all spin-related tags
tag @e[tag=mystery_box_gun,distance=..10] remove spin
tag @e[tag=mystery_box_gun,distance=..10] remove speed_fast
tag @e[tag=mystery_box_gun,distance=..10] remove speed_medium
tag @e[tag=mystery_box_gun,distance=..10] remove speed_slow

# Reset the spin timer
scoreboard players set @e[tag=mystery_box_gun,distance=..10] mystery_box_spin_timer 0

# Find the mystery box root entity and interrupt the buy animation by pausing it
execute as @e[tag=mystery_box_root,type=block_display,distance=..10,limit=1,sort=nearest] at @s run tag @s add animation_pause
