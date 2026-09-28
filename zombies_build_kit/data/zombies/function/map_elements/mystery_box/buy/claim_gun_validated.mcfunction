# Validated claim function - @s is mystery_box_location marker
# Check if claiming is allowed - ERROR MESSAGE (keep visible to all players)

execute unless score @s mystery_box_can_claim matches 1 run tellraw @a {"text":"Cannot claim gun right now!","color":"red"}
execute unless score @s mystery_box_can_claim matches 1 run return 0

# Check if the claiming player is the one who bought from this box - ERROR MESSAGE (keep visible to all players)
# #interacting_player_id temp is set in interact.mcfunction
execute unless score #interacting_player_id temp = @s mystery_box_player_id as @a if score @s id = #interacting_player_id temp run tellraw @s {"text":"This weapon belongs to another player!","color":"red"}
execute unless score #interacting_player_id temp = @s mystery_box_player_id run return 0

# Get gun ID and name from selected gun
scoreboard players operation #gun_id temp = @s mystery_box_selected_gun
scoreboard players operation #player_id temp = @s mystery_box_player_id
function zombies:map_elements/mystery_box/guns/get_gun_name

# Give the gun to the player who interacted with the box
execute as @a if score @s id = #player_id temp run function zombies:map_elements/mystery_box/guns/give_gun_by_id

# Display claim message with gun name
execute as @a if score @s id = #player_id temp run function zbk:dispatch/voice_event_box_gun
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"Gun claimed: ","color":"gold"},{"nbt":"gun_name","storage":"zombies:temp","color":"yellow"}]

# DEBUG: Log claim state
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[MB-DEBUG] claim_gun_validated: ","color":"aqua"},{"text":"Claiming gun. pending_empty=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_pending_empty"},"color":"yellow"},{"text":" active=","color":"gray"},{"score":{"name":"@s","objective":"mystery_box_active"},"color":"yellow"},{"text":" fire_sale=","color":"gray"},{"score":{"name":"global","objective":"fire_sale"},"color":"yellow"}]

# Disable claiming immediately
scoreboard players set @s mystery_box_can_claim 0

# Hide the claimed reward before the close animation moves the display back into the box.
data remove entity @e[type=item_display,tag=mystery_box_gun,distance=..2,limit=1,sort=nearest] item

# Stop the buy animation by removing all animation tags
# We need to determine which direction the box is facing
execute if entity @s[tag=facing_north] run tag @e[tag=anim_buy_north,distance=..2] remove anim_buy_north
execute if entity @s[tag=facing_south] run tag @e[tag=anim_buy_south,distance=..2] remove anim_buy_south
execute if entity @s[tag=facing_east] run tag @e[tag=anim_buy_east,distance=..2] remove anim_buy_east
execute if entity @s[tag=facing_west] run tag @e[tag=anim_buy_west,distance=..2] remove anim_buy_west

# Trigger box_close animation
function zombies:map_elements/mystery_box/animation/triggers/box_close
