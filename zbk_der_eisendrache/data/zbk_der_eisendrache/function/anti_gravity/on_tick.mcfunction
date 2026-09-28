# Track room crossings through the four normal portals.
execute as @e[type=minecraft:marker,tag=de_ag_portal] at @s run function zbk_der_eisendrache:anti_gravity/portal/tick

# The 115 Start marker is a reversible movement-suppression zone.
function zbk_der_eisendrache:anti_gravity/suppression/tick_115_zone

# Advance an unlocked cycle before checking incomplete activation plates.
execute if score #unlocked de_ag_cycle matches 1 run function zbk_der_eisendrache:anti_gravity/cycle/tick
execute unless score #unlocked de_ag_cycle matches 1 run function zbk_der_eisendrache:anti_gravity/plates/tick

# Keep the room's audio loop aligned to real time even when game ticks slow down.
execute if score #room de_ag_state matches 1 run function zbk_der_eisendrache:anti_gravity/audio/tick

# Apply active player movement, air-jump, presentation, and wall-run behavior.
function zbk_der_eisendrache:anti_gravity/movement/tick
function zbk_der_eisendrache:anti_gravity/double_jump/tick
function zbk_der_eisendrache:anti_gravity/effects/tick
function zbk_der_eisendrache:anti_gravity/wall_run/on_tick
function zbk_der_eisendrache:anti_gravity/boundary/tick

# Show placement diagnostics only while at least one player requests them.
execute if entity @a[tag=de_ag_debug] run function zbk_der_eisendrache:anti_gravity/debug/show_markers
