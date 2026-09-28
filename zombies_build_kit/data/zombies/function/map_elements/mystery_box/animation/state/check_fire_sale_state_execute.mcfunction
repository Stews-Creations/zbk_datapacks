# === CHECK FIRE SALE STATE EXECUTE ===
# @s = mystery_box_location marker
# Determines correct animation based on fire_sale and mystery_box_active state

execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] check_fire_sale_state: ","color":"aqua"},{"text":"fire_sale=","color":"gray"},{"score":{"name":"global","objective":"fire_sale"},"color":"yellow"},{"text":" active=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_active"},"color":"yellow"},{"text":" ready=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_ready"},"color":"yellow"},{"text":" last_anim=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_last_anim"},"color":"yellow"}]

# If fire sale is active AND box is NOT ready -> spawn fire sale box
# (works for both active and inactive locations)
execute if score global fire_sale matches 1 if score @s mystery_box_ready matches 0 run function zombies:map_elements/mystery_box/animation/triggers/spawn_fire_sale

# If fire sale is NOT active AND box is NOT active AND last anim was NOT empty/box_close -> ensure box is empty
# (Prevents infinite loop - don't re-empty if we just finished empty animation)
# (Skip if last anim was box_close (3) since box is already visually correct - lid closed)
# (Skip if box_close animation is currently running to avoid overlap)
# (Removed mystery_box_ready check to allow emptying ready/spawned boxes when fire sale ends)
execute unless score global fire_sale matches 1 if score @s mystery_box_active matches 0 unless score @s mystery_box_last_anim matches 1 unless score @s mystery_box_last_anim matches 3 at @s unless entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_box_close_north,limit=1] unless entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_box_close_south,limit=1] unless entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_box_close_east,limit=1] unless entity @e[tag=mystery_box_root,type=block_display,distance=..2,tag=anim_box_close_west,limit=1] run function zombies:map_elements/mystery_box/animation/triggers/empty

# Clear pending empty flag - box is in correct state (either just emptied or just closed)
execute unless score global fire_sale matches 1 if score @s mystery_box_active matches 0 run scoreboard players reset @s mystery_box_pending_empty

# If fire sale is NOT active AND box IS active AND NOT ready -> spawn normal box (restore real location)
execute unless score global fire_sale matches 1 if score @s mystery_box_active matches 1 if score @s mystery_box_ready matches 0 run function zombies:map_elements/mystery_box/animation/triggers/spawn
