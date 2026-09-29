# Consume the punch before a map sound override can return early.
data remove entity @s attack
function zbk:map_elements/radio/events/sound_radio_stop
execute if data storage zbk:events result{blocked:1b} run return 0
# Stop the shared radio cue when no map overrides it.
stopsound @a music zbk:radio
