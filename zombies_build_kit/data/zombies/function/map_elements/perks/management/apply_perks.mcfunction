# === APPLY PERKS FUNCTION ===
# Runs every tick to check player perk scoreboard objectives and apply effects
# Scalable format: add new perks by copying a block and updating the objective & effect

# === JUGGERNOG ===
# Double max health if perk active
execute as @a if score @s perk_jugg matches 1.. run attribute @s minecraft:max_health base set 60
# Reset to default if perk not active
execute as @a unless score @s perk_jugg matches 1.. run attribute @s minecraft:max_health base set 40

# === STAMINA UP ===
# Increase movement speed if perk active
execute as @a if score @s perk_stamina matches 1.. run attribute @s minecraft:movement_speed base set 0.15
# Reset if perk not active
execute as @a unless score @s perk_stamina matches 1.. run attribute @s minecraft:movement_speed base set 0.1

# === QUICK REVIVE ===
# Give regeneration if perk active
execute as @a if score @s perk_revive matches 1.. run effect give @s minecraft:regeneration 1 1 true
# Remove regeneration if perk not active
execute as @a unless score @s perk_revive matches 1.. run effect clear @s minecraft:regeneration

# === PERK BONUS DETECTION ===
# Check if any sneaking player is near an available bonus marker
execute as @a[predicate=zombies:is_sneaking] at @s as @e[type=marker,tag=perk_bonus,tag=bonus_available,distance=..2] run function zombies:map_elements/perks/management/claim_bonus
