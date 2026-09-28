# === TEMPORARY GREEN HIGHLIGHT AFTER SHIFT ===
# Runs as the sign marker, at its position. Shows 1-second green glow.

# Kill any existing shift highlight first
execute as @e[type=magma_cube,tag=cd_sign_highlight] run tp @s ~ -10000 ~

# Summon new highlight
summon minecraft:magma_cube ~ ~ ~ {Size:1,Silent:1b,Invulnerable:1b,Invisible:1b,NoAI:1b,PersistenceRequired:1b,DeathLootTable:"minecraft:empty",Tags:["cd_sign_highlight"],active_effects:[{id:"minecraft:invisibility",duration:-1,amplifier:0,show_particles:0b},{id:"minecraft:glowing",duration:-1,amplifier:3,show_particles:0b}]}
team join highlight_green @e[type=magma_cube,tag=cd_sign_highlight,distance=..1,limit=1,sort=nearest]
schedule function zombies:map_elements/custom_door/spawning/sign_highlight_remove 20t
