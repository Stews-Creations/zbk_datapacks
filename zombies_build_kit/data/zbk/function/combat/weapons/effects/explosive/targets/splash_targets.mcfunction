# One selector snapshots every blast victim before any crawler replacements exist.
# Radius is copied from the active profile; direct hits are handled separately.
$execute as @e[type=!#zbk:not_mob,type=!player,distance=..$(radius),tag=!explosion_direct_hit,tag=!combat_ignore,tag=!immune_explosives,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zbk:combat/weapons/effects/explosive/damage/apply_splash_damage
$function zbk:combat/weapons/events/extension/effects/explosive/splash_targets {radius:"$(radius)"}
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
$execute unless data storage zbk:events result{blocked:1b} run execute as @a[distance=..$(radius)] if score @s id = #shooter_id stats at @s run function zbk:combat/weapons/effects/explosive/damage/handle_self_damage
