# ===================================
# PACK-A-PUNCH - UPDATE DISPLAY (dispatcher)
# ===================================
# Called as the pack_a_punch marker entity (@s).
# Routes to the correct direction file based on the marker's tag.
# ===================================

execute if entity @s[tag=pack_a_punch_north] run function zbk:map_elements/pack_a_punch/display/update_display_north
execute if entity @s[tag=pack_a_punch_south] run function zbk:map_elements/pack_a_punch/display/update_display_south
execute if entity @s[tag=pack_a_punch_east] run function zbk:map_elements/pack_a_punch/display/update_display_east
execute if entity @s[tag=pack_a_punch_west] run function zbk:map_elements/pack_a_punch/display/update_display_west
