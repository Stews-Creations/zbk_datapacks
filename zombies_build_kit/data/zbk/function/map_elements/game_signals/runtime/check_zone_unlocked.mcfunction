# Check if this zone_unlocked signal's zone matches the zone being unlocked
# Run as each signal_zone_unlocked marker

# Get this signal's zone number
execute store result score #signal_zone global run data get entity @s data.zone

# Compare to the zone being unlocked - fire if matching
execute if score #signal_zone global = #zone_to_unlock global if entity @s[tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute if score #signal_zone global = #zone_to_unlock global if entity @s[tag=signal_toggle] at @s run setblock ~ ~ ~ redstone_block

# Schedule pulse reset if any pulse signals fired
execute if score #signal_zone global = #zone_to_unlock global if entity @s[tag=signal_pulse] run schedule function zbk:map_elements/game_signals/runtime/pulse_reset_zone_unlocked 20t
