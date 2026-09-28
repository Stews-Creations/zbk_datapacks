# === CLEAR PLAYER PERKS ===
# Purpose: Clear all perks for the executing player
# Called when a player is revived from being downed
# Note: Does NOT reset revive_buys (solo Quick Revive purchase counter)

# Clear all perk scores for this player
scoreboard players set @s perk_jugg 0
scoreboard players set @s perk_stamina 0
scoreboard players set @s perk_speed 0
scoreboard players set @s perk_doubletap 0
scoreboard players set @s perk_revive 0
scoreboard players set @s perk_mule 0
scoreboard players set @s perk_count 0
scoreboard players set @s perk_order 0

# Clear perk items
clear @s potion
function zbk:combat/weapons/management/remove_mule_gun
