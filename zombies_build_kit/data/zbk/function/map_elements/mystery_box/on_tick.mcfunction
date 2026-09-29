# Only location-local presentation shares a lookup.
# Preserve global pending-animation and relocation order because boxes share selection state.

# ===================================
# MYSTERY BOX SUBMODULE - TICK
# ===================================
# Runs every game tick for mystery box system

function zbk:map_elements/mystery_box/display/restore_text_rendering

# ===== SPAWN EGG DETECTION =====
# Detect and process placement of mystery box spawn egg entity (bat marker)
execute if entity @e[type=minecraft:bat,name="Mystery Box Location"] run function zbk:map_elements/mystery_box/spawning/spawn

# ===== MYSTERY BOX SYSTEM =====
# Handle gun spinning based on speed tags
function zbk:map_elements/mystery_box/guns/display/tick_spin

# Run animation effects (smoke only - lightning is now instant)
execute as @e[type=marker,tag=mystery_box_smoke_effect] at @s run function mystery_box:effects/smoke_tick

# Run idle box particles for active locations
execute as @e[type=marker,tag=mystery_box_location,tag=!disabled] at @s run function zbk:map_elements/mystery_box/animation/tick_location_effects

# Run beam effect for active locations (only if more than 1 location exists)

# ===== PENDING ANIMATION HANDLERS =====
# Handle pending spawn (fire sale) - when box finishes animating and fire sale is still active
# Also check for teddy bear and box_close animations to prevent conflicts
execute if score global fire_sale matches 1 as @e[tag=mystery_box_location,type=marker,scores={mystery_box_pending_spawn=1}] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] unless score @s mystery_box_frame matches 1.. unless entity @s[tag=anim_teddy_bear_north] unless entity @s[tag=anim_teddy_bear_south] unless entity @s[tag=anim_teddy_bear_east] unless entity @s[tag=anim_teddy_bear_west] unless entity @s[tag=anim_box_close_north] unless entity @s[tag=anim_box_close_south] unless entity @s[tag=anim_box_close_east] unless entity @s[tag=anim_box_close_west] at @s as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zbk:map_elements/mystery_box/animation/triggers/spawn_from_pending

# Handle pending empty (fire sale cleanup) - when box finishes animating
# Also check for teddy bear and box_close animations to prevent conflicts
# DEBUG: Log when pending_empty is detected
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_pending_empty=1,mystery_box_active=0}] as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] on_tick: ","color":"aqua"},{"text":"found pending_empty location, checking root conditions...","color":"yellow"}]
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_pending_empty=1,mystery_box_active=0}] at @s as @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] unless score @s mystery_box_frame matches 1.. unless entity @s[tag=anim_teddy_bear_north] unless entity @s[tag=anim_teddy_bear_south] unless entity @s[tag=anim_teddy_bear_east] unless entity @s[tag=anim_teddy_bear_west] unless entity @s[tag=anim_box_close_north] unless entity @s[tag=anim_box_close_south] unless entity @s[tag=anim_box_close_east] unless entity @s[tag=anim_box_close_west] at @s as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zbk:map_elements/mystery_box/animation/triggers/empty_validated
