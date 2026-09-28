# === HIGHLIGHT CHECK - SUMMON MAGMA CUBE IF SAVED BLOCK IS NON-AIR ===
# Macro: checks block at (sx,sy,sz) in door_storage, summons cube at (x,y,z) in overworld

$execute positioned $(sx) $(sy) $(sz) in zbk:door_storage unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air positioned $(x) $(y) $(z) in minecraft:overworld run summon minecraft:magma_cube ~ ~ ~ {Size:1,Silent:1b,Invulnerable:1b,Invisible:1b,NoAI:1b,PersistenceRequired:1b,DeathLootTable:"minecraft:empty",Tags:["cd_highlight_cube","cd_highlight_new"],active_effects:[{id:"minecraft:invisibility",duration:-1,amplifier:0,show_particles:0b},{id:"minecraft:glowing",duration:-1,amplifier:3,show_particles:0b}]}
