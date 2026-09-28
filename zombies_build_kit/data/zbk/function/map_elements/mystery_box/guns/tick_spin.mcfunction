# Tick function to handle gun spinning based on speed tags
# This runs every tick and checks entities with the "spin" tag

# Fast speed - cycle every tick
execute as @e[type=item_display,tag=spin,tag=speed_fast,tag=mystery_box_gun] at @s run function zbk:map_elements/mystery_box/guns/cycle_gun

# Medium speed - cycle every 5 ticks (using a scoreboard timer)
scoreboard players add @e[type=item_display,tag=spin,tag=speed_medium,tag=mystery_box_gun] mystery_box_spin_timer 1
execute as @e[type=item_display,tag=spin,tag=speed_medium,tag=mystery_box_gun,scores={mystery_box_spin_timer=5..}] at @s run function zbk:map_elements/mystery_box/guns/cycle_gun
scoreboard players set @e[type=item_display,tag=spin,tag=speed_medium,tag=mystery_box_gun,scores={mystery_box_spin_timer=5..}] mystery_box_spin_timer 0

# Slow speed - cycle every 10 ticks (using a scoreboard timer)
scoreboard players add @e[type=item_display,tag=spin,tag=speed_slow,tag=mystery_box_gun] mystery_box_spin_timer 1
execute as @e[type=item_display,tag=spin,tag=speed_slow,tag=mystery_box_gun,scores={mystery_box_spin_timer=10..}] at @s run function zbk:map_elements/mystery_box/guns/cycle_gun
scoreboard players set @e[type=item_display,tag=spin,tag=speed_slow,tag=mystery_box_gun,scores={mystery_box_spin_timer=10..}] mystery_box_spin_timer 0
