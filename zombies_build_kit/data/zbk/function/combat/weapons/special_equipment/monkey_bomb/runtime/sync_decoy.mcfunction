# Copy the bomb link ID before switching executor to its decoy.
# Do not add at @s to the decoy selection: the destination must remain the bomb position.

# ===================================
# SYNC MONKEY BOMB DECOY
# ===================================
# Called as the monkey bomb marker, positioned at the marker.

scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute as @e[type=zombie,tag=monkey_bomb_decoy] if score @s grenade_id = #current_grenade_id grenade_id run function zbk:combat/weapons/special_equipment/monkey_bomb/runtime/sync_target
