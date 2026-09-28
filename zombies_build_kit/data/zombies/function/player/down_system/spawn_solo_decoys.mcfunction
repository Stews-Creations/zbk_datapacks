# === SPAWN SOLO DECOYS ===
# Purpose: Summon decoy entities at nearby dog spawners to lure zombies away from downed solo player
# Context: @s = downed player, at @s = player position

# Tag the 3 closest unlocked dog spawners that are at least 3 blocks away
tag @e[type=marker,tag=dog_spawner,distance=3..,scores={spawner_unlocked=1},sort=nearest,limit=3] add decoy_candidate

# Summon an invisible invulnerable zombie at each candidate spawner (living entity so piglins pathfind to it)
execute as @e[type=marker,tag=decoy_candidate] at @s run summon zombie ~ ~ ~ {Team:"downed",NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Fire:0s,DeathLootTable:"minecraft:empty",Tags:["solo_down_decoy","combat_ignore"],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b},{id:"minecraft:fire_resistance",amplifier:0,duration:-1,show_particles:0b}]}

# Clear candidate tags
tag @e[type=marker,tag=decoy_candidate] remove decoy_candidate
