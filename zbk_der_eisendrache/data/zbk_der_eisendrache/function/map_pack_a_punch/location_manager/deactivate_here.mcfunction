# Deactivate the active map PaP machine without deleting its location marker.
# Called as/at a map_pack_a_punch_active marker.

stopsound @a player zbk_der_eisendrache:de_pack.claim_waiting

# Restore an in-flight buyer if this is called during reset or deletion.
scoreboard players reset #pap_buyer_temp stats
execute as @e[type=marker,distance=..8,tag=de_pack_a_punch_location,limit=1,sort=nearest] run scoreboard players operation #pap_buyer_temp stats = @s pap_buyer_id
execute unless entity @e[type=marker,distance=..8,tag=de_pack_a_punch_location,limit=1,sort=nearest] run scoreboard players operation #pap_buyer_temp stats = @s pap_buyer_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 1..3 run tag @s add map_pap_restore_inventory
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 1 run scoreboard players operation @s gun_1 = @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 2 run scoreboard players operation @s gun_2 = @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 3 run scoreboard players operation @s gun_3 = @s pap_pending_gun_id
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_slot matches 1..3 run scoreboard players reset @s pap_pending_slot
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_tier matches 1..2 run scoreboard players reset @s pap_pending_tier
execute as @a if score @s id = #pap_buyer_temp stats if score @s pap_pending_gun_id matches 1.. run scoreboard players reset @s pap_pending_gun_id
execute as @a[tag=map_pap_restore_inventory] run function zbk:api/player/inventory/weapons
tag @a remove map_pap_restore_inventory

function zbk_der_eisendrache:map_pack_a_punch/machine/model/delete_nearest

kill @e[type=item_display,distance=..3,tag=pack_a_punch_core,limit=1,sort=nearest]
kill @e[type=item_display,distance=..3,tag=pack_a_punch_flag,limit=1,sort=nearest]
kill @e[type=item_display,distance=..3,tag=pack_a_punch_rotaters,limit=1,sort=nearest]
kill @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest]
kill @e[type=text_display,distance=..3,tag=pack_a_punch_title,limit=1,sort=nearest]
kill @e[type=text_display,distance=..3,tag=pack_a_punch_raygun,limit=1,sort=nearest]
kill @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest]
kill @e[type=interaction,distance=..3,tag=pack_a_punch_interaction,limit=6,sort=nearest]

tag @s remove pap_busy
tag @s remove pap_claim_ready
tag @s remove pap_song_lock
tag @s remove pap_anim_active
scoreboard players reset @s pap_anim
scoreboard players reset @s pap_buyer_id

tag @s remove pack_a_punch
tag @s remove pack_a_punch_initialized
tag @s remove pack_a_punch_south
tag @s remove pack_a_punch_west
tag @s remove pack_a_punch_north
tag @s remove pack_a_punch_east
tag @s remove map_pack_a_punch_active
tag @s remove map_pap_move_pending
scoreboard players set @s map_pap_uses 0
scoreboard players set @s map_pap_rounds 0

function zbk_der_eisendrache:map_pack_a_punch/spawning/spawn_location_ui
