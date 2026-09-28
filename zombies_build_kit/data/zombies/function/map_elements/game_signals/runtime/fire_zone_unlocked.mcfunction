# Fire Zone Unlocked signals that match the current #zone_to_unlock score
# Called from unlock_spawners_recursive for each zone being unlocked
# Each signal marker stores data.zone = zone number it listens to

# For each zone_unlocked signal, check if its zone matches #zone_to_unlock
execute as @e[type=marker,tag=signal_zone_unlocked] run function zombies:map_elements/game_signals/runtime/check_zone_unlocked
