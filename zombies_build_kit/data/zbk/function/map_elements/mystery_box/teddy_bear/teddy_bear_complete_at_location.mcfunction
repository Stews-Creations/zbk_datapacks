# === TEDDY BEAR COMPLETE - AT LOCATION ===
# @s = mystery_box_location marker
#
# Simple flow:
# 1. Set state (deactivate this location)
# 2. Request empty animation via pending_empty (on_tick handles it next tick)
# 3. Select new location and spawn box there
#
# Fire sale handling is NOT done here. After the empty animation plays,
# check_fire_sale_state runs at the end of empty's keyframe_0 and naturally
# spawns a fire_sale box if fire_sale is active — same as every other location.

# DEBUG: Log state at start
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] teddy_complete_at_loc: ","color":"aqua"},{"text":"fire_sale=","color":"gray"},{"score":{"name":"global","objective":"fire_sale"},"color":"yellow"},{"text":" ready=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_ready"},"color":"yellow"},{"text":" active=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_active"},"color":"yellow"}]

# === STEP 1: Set state ===
scoreboard players set @s mystery_box_active 0
scoreboard players set @s mystery_box_ready 0
scoreboard players set @s mystery_box_last_anim 1

# === STEP 2: Request empty on next tick ===
scoreboard players set @s mystery_box_pending_empty 1

# === STEP 3: Select new location and spawn box there ===
function zbk:map_elements/mystery_box/location_manager/select_new_location_after_teddy

# DEBUG: Log state at end
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] teddy_complete_at_loc END: ","color":"aqua"},{"text":"ready=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_ready"},"color":"yellow"},{"text":" active=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_active"},"color":"yellow"},{"text":" pending_empty=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_pending_empty"},"color":"yellow"}]
