# Apply the same 256-block follow range on every real-piglin creation path.
# This attribute is independent of the relocation distance and does not change wave slot accounting.

# Keep explicit adult state; the data merge also clears the summon scratch tag.
# Executed as the exact new piglin; the caller owns accounting and stats.
data merge entity @s {IsBaby:0b,Tags:["wave_zombie","wave_enemy","wz_created"],AngerTime:1000,PersistenceRequired:1b,equipment:{mainhand:{id:"minecraft:golden_sword",count:1,components:{"minecraft:attack_range":{max_reach:0.75,mob_factor:1.0},"minecraft:item_model":"zbk:empty"}}},drop_chances:{mainhand:0.0f},attributes:[{id:"minecraft:follow_range",base:256}]}
function zbk:waves/spawning/zombie/creation/from_marker
function zbk:dispatch/enemy_spawned
return 1
