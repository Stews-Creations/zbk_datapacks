# === GRANT QUICK REVIVE PERK ===
# Grants the perk (point deduction handled by buy_solo/buy_coop.mcfunction)

function zbk:debug/info {f:"PERK",m:"Quick Revive granted"}

# Increment perk count
scoreboard players add @s perk_count 1

# Increment purchase order counter and assign to this perk
scoreboard players add @s perk_order 1
scoreboard players operation @s perk_revive = @s perk_order

# Play jingle
execute as @s run function zbk:map_elements/perks/quick_revive/sound

execute as @s run function zbk:map_elements/perks/events/voice_event_perk_pickup
