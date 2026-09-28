# Dead Wire element — run as @s = the hit entity.
# Returns 1 (consumes the bullet) — kills are instant via the zap loop.

# Skip non-piglin targets
execute unless entity @s[type=zombified_piglin] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Cooldown gate + 25%-per-bullet roll + cooldown reset + shooter id stash.
# Bails with return 0 if either gate fails (cooldown active OR roll missed).
function zombies:combat/weapons/pack_a_punch/elements/_common/cooldown_roll {prefix:"dw"}
execute if score #cooldown_roll_pass temp matches 0 run return 0

# --- Trigger ---

# Big lightning visual + sound at the hit point
particle minecraft:electric_spark ~ ~1 ~ 1 1.5 1 0.8 60 force
particle minecraft:flash{color:[0.6,0.8,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:cloud ~ ~0.5 ~ 0.5 0.2 0.5 0.1 20 force
playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..40] ~ ~ ~ 0.5 1.5
playsound minecraft:item.trident.thunder master @a[distance=..30] ~ ~ ~ 1 1.3

# Zap up to 9 nearest piglins (including the direct hit) — instant kill + attribution
execute as @e[type=zombified_piglin,distance=..6,tag=!immune_elements,sort=nearest,limit=9] at @s run function zombies:combat/weapons/pack_a_punch/elements/dead_wire/zap

# Stun the rest (anything in radius that wasn't zapped)
execute as @e[type=zombified_piglin,distance=..6,tag=!dw_zapped,tag=!immune_elements] at @s run function zombies:combat/weapons/pack_a_punch/elements/dead_wire/stun

return 1
