# === PLACE CORNER MARKER (MACRO) ===
# Runs at block-aligned position (after align xyz). Summons marker at block center.
# Expects storage zombies:temp cd_spawn with: type, type_tag, dir
$summon marker ~0.5 ~0.5 ~0.5 {Tags:["custom_door","$(type_tag)","$(dir)"],data:{name:"Corner $(type)"}}

# Temporary green highlight (1 second)
summon minecraft:magma_cube ~0.5 ~ ~0.5 {Size:1,Silent:1b,Invulnerable:1b,Invisible:1b,NoAI:1b,PersistenceRequired:1b,DeathLootTable:"minecraft:empty",Tags:["cd_corner_highlight"],active_effects:[{id:"minecraft:invisibility",duration:-1,amplifier:0,show_particles:0b},{id:"minecraft:glowing",duration:-1,amplifier:3,show_particles:0b}]}
team join highlight_green @e[type=magma_cube,tag=cd_corner_highlight,distance=..1,limit=1,sort=nearest]
schedule function zombies:map_elements/custom_door/spawning/corner_highlight_remove 60t
