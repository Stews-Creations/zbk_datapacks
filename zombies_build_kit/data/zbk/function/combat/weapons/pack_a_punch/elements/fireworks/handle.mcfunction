# Fireworks element — run as @s = the hit entity.
# Returns 1 (consumes the bullet) — the kill happens after the firework show.

# Skip non-piglin targets
execute unless entity @s[type=zombified_piglin] run return 0
execute if entity @s[tag=immune_elements] run return 0

# Cooldown gate + 25%-per-bullet roll + cooldown reset + shooter id stash.
# Bails with return 0 if either gate fails (cooldown active OR roll missed).
function zbk:combat/weapons/pack_a_punch/elements/_common/cooldown_roll {prefix:"fw"}
execute if score #cooldown_roll_pass temp matches 0 run return 0

# --- Trigger ---

# AoE: mark every piglin in 6-block radius (including direct hit) for delayed kill
# (Sequential blank rockets are spawned by mark_tick on the trigger zombie over 30 ticks)
execute as @e[type=zombified_piglin,distance=..6,tag=!immune_elements] at @s run function zbk:combat/weapons/pack_a_punch/elements/fireworks/mark

# Tag the trigger zombie so finish.mcfunction knows where to fire the finale
tag @s add fw_trigger_center

return 1
