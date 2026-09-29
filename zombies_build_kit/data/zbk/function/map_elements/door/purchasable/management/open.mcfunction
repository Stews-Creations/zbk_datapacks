# === OPEN DOOR (START ANIMATION) ===
# Runs at the door marker to start the opening animation
# Tag this door as purchased and start timer (unless it's a jump_spot/couch_door which don't animate)
tag @s add purchased
execute if entity @s[tag=!door_jump_spot] run scoreboard players set @s door_anim_timer 0

# Unlock spawners in this door's zones
function zbk:map_elements/door/management/unlock_spawners_for_zones

# Visual effects
particle minecraft:cloud ~ ~2 ~ 1 1 1 0.2 50 force
particle minecraft:poof ~ ~2 ~ 1 1 1 0.1 30 force

# Sound effects
playsound minecraft:block.iron_door.open master @a ~ ~ ~ 2 0.5
playsound minecraft:block.piston.extend master @a ~ ~ ~ 2 0.8
playsound minecraft:entity.zombie.attack_wooden_door master @a ~ ~ ~ 1 0.7

# Place jump_spot_down if this is a jump spot (doesn't animate, just instant placement)
execute if entity @s[tag=door_jump_spot,tag=door_south] at @s run place template zbk:doors/jump_spot_down ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_jump_spot,tag=door_west] at @s run place template zbk:doors/jump_spot_down ~ ~ ~-1 none
execute if entity @s[tag=door_jump_spot,tag=door_north] at @s run place template zbk:doors/jump_spot_down ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_jump_spot,tag=door_east] at @s run place template zbk:doors/jump_spot_down ~ ~ ~1 180

# Kill any nearby text displays and interaction entities
kill @e[type=text_display,tag=door_ui,distance=..5]
kill @e[type=interaction,tag=door_interaction,distance=..5]
