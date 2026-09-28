# Blast Furnace element — run as @s = the hit entity.
# Returns 0 (lets collide finish) so the boosted #damage kills the direct hit
# with normal kill attribution. AoE burn is applied here before returning.

# Skip non-piglin targets
execute unless entity @s[type=zombified_piglin] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Cooldown gate + 25%-per-bullet roll + cooldown reset + shooter id stash.
# Bails with return 0 if either gate fails (cooldown active OR roll missed).
function zombies:combat/weapons/pack_a_punch/elements/_common/cooldown_roll {prefix:"bf"}
execute if score #cooldown_roll_pass temp matches 0 run return 0

# --- Trigger ---

# Visual + sound at hit point
particle minecraft:flame ~ ~1 ~ 1 1 1 0.1 80 force
particle minecraft:lava ~ ~1 ~ 1 1 1 0.05 12 force
particle minecraft:large_smoke ~ ~1 ~ 1 1 1 0.02 20 force
playsound minecraft:entity.blaze.shoot master @a[distance=..30] ~ ~ ~ 1 0.6
playsound minecraft:item.firecharge.use master @a[distance=..30] ~ ~ ~ 1 0.7

# AoE: ignite + DoT all nearby piglins (excluding direct hit, which collide will kill)
tag @s add bf_direct_hit
execute as @e[type=zombified_piglin,distance=..6,tag=!bf_direct_hit,tag=!immune_elements] at @s run function zombies:combat/weapons/pack_a_punch/elements/blast_furnace/burn
tag @s remove bf_direct_hit

# Boost direct-hit damage to insta-kill — collide handles the actual kill + attribution
scoreboard players operation #damage stats = #insta_kill stats

# Set fire on direct hit too for visual
data modify entity @s Fire set value 100s

return 0
