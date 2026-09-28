# Called at keyframe 50 (final roll) - determines the final gun or triggers teddy bear
# Progressive probability based on number of spins at this location

# Count spawn locations to determine if teddy bear can trigger
function zbk:map_elements/mystery_box/location_manager/count_spawn_locations

# Only one box location: Teddy bear never triggers (always select gun)
execute if score #total_spawn_locations mystery_box_location_id matches ..1 run scoreboard players set #teddy_bear_roll temp 0
execute if score #total_spawn_locations mystery_box_location_id matches ..1 run return run function zbk:map_elements/mystery_box/guns/select_gun

# Fire Sale: Teddy bear never triggers during fire sale (always select gun)
execute if score global fire_sale matches 1 run scoreboard players set #teddy_bear_roll temp 0
execute if score global fire_sale matches 1 run return run function zbk:map_elements/mystery_box/guns/select_gun

# Get the spin count from the nearest mystery box location
execute store result score #spin_count temp run scoreboard players get @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] mystery_box_spins

# Spins 1-3: 0% chance (always select gun)
execute if score #spin_count temp matches ..3 run scoreboard players set #teddy_bear_roll temp 0
execute if score #spin_count temp matches ..3 run return run function zbk:map_elements/mystery_box/guns/select_gun

# Spins 4-7: ~15% chance (1 in 7, trigger on roll 0)
execute if score #spin_count temp matches 4..7 store result score #teddy_bear_roll temp run random value 0..6
execute if score #spin_count temp matches 4..7 if score #teddy_bear_roll temp matches 0 run scoreboard players set #teddy_bear_roll temp 1
execute if score #spin_count temp matches 4..7 if score #teddy_bear_roll temp matches 1 run return run function zbk:map_elements/mystery_box/teddy_bear/trigger_teddy_bear
execute if score #spin_count temp matches 4..7 run scoreboard players set #teddy_bear_roll temp 0
execute if score #spin_count temp matches 4..7 run return run function zbk:map_elements/mystery_box/guns/select_gun

# Spins 8-11: ~30% chance (1 in 3, trigger on roll 0)
execute if score #spin_count temp matches 8..11 store result score #teddy_bear_roll temp run random value 0..2
execute if score #spin_count temp matches 8..11 if score #teddy_bear_roll temp matches 0 run scoreboard players set #teddy_bear_roll temp 1
execute if score #spin_count temp matches 8..11 if score #teddy_bear_roll temp matches 1 run return run function zbk:map_elements/mystery_box/teddy_bear/trigger_teddy_bear
execute if score #spin_count temp matches 8..11 run scoreboard players set #teddy_bear_roll temp 0
execute if score #spin_count temp matches 8..11 run return run function zbk:map_elements/mystery_box/guns/select_gun

# Spins 12+: 50% chance (1 in 2, trigger on roll 0)
execute if score #spin_count temp matches 12.. store result score #teddy_bear_roll temp run random value 0..1
execute if score #teddy_bear_roll temp matches 0 run scoreboard players set #teddy_bear_roll temp 1
execute if score #teddy_bear_roll temp matches 1 run return run function zbk:map_elements/mystery_box/teddy_bear/trigger_teddy_bear

# Otherwise select gun
scoreboard players set #teddy_bear_roll temp 0
function zbk:map_elements/mystery_box/guns/select_gun
