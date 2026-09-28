# Thunder Wall element — run as @s = the hit entity.
# Returns 1 (consumes the bullet) — the launch is the kill, no direct damage applied.

# Skip non-piglin targets
execute unless entity @s[type=zombified_piglin] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Cooldown gate + 25%-per-bullet roll + cooldown reset + shooter id stash.
# Bails with return 0 if either gate fails (cooldown active OR roll missed).
function zbk:combat/weapons/pack_a_punch/elements/_common/cooldown_roll {prefix:"tw"}
execute if score #cooldown_roll_pass temp matches 0 run return 0

# --- Trigger ---

# Visual + sound at hit point
particle minecraft:cloud ~ ~0.5 ~ 1 0.2 1 0.3 60 force
particle minecraft:electric_spark ~ ~1 ~ 1 1 1 0.5 40 force
particle minecraft:flash{color:[1.0,1.0,0.8,1.0]} ~ ~1 ~ 0 0 0 0 1 force
playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..40] ~ ~ ~ 0.6 1.4
playsound minecraft:item.trident.thunder master @a[distance=..30] ~ ~ ~ 1 1.2

# AoE: launch every piglin in 5-block radius (including direct hit)
execute as @e[type=zombified_piglin,distance=..5,tag=!immune_elements] at @s run function zbk:combat/weapons/pack_a_punch/elements/thunder_wall/launch

return 1
