# ===================================
# GRENADE DROP DETECTION
# ===================================
# Detects an owned knife dropped from selected key 4 (Q key)
# Cancels the drop and gives them a grenade to throw

# Match the selected player, native thrower UUID, knife owner and available ammo.
execute as @a[scores={grenade_ammo=1..},nbt={SelectedItemSlot:3}] at @s run function zbk:combat/weapons/grenade/detection/check_thrower

# Delete only items that were tagged as grenade drops (the ones that matched the thrower)
kill @e[type=item,tag=grenade_drop]
