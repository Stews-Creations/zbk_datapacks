# Current dimension only. Gameplay visibility below the cap (including zero) is retained.
execute as @e[distance=0..,type=minecraft:block_display,tag=!zbk_range_checked] run function zombies:global/rendering/cap_display
execute as @e[distance=0..,type=minecraft:item_display,tag=!zbk_range_checked] run function zombies:global/rendering/cap_display
execute as @e[distance=0..,type=minecraft:text_display,tag=!zbk_range_checked] run function zombies:global/rendering/cap_display
