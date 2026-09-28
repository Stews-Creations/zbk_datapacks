function zbk:combat/weapons/guns/bo3/migration/marker
# ===================================
# WALL GUN - UPDATE DISPLAY
# ===================================
# Purpose: Create/update text and item displays for wall gun
# Executed as the wall gun marker entity
# ===================================

# Resolve marker defaults and the displayed weapon.
function zbk:map_elements/wall_gun/marker/initialize_prices
execute store result score $wall_gun_id wall_gun_price run data get entity @s data.gun_id

# Get gun name for display
scoreboard players operation #gun_id temp = $wall_gun_id wall_gun_price
function zbk:map_elements/wall_gun/lookup/get_item_name

# Snapshot literal prices per wall so other walls cannot change this label.
function zbk:map_elements/wall_gun/display/build_text with entity @s data
data modify storage zbk:temp wall_gun_display_text[0].text set from storage zbk:temp gun_name

# Route to orientation-specific display function
execute if entity @s[tag=wall_gun_south] run function zbk:map_elements/wall_gun/display/update_display_south
execute if entity @s[tag=wall_gun_west] run function zbk:map_elements/wall_gun/display/update_display_west
execute if entity @s[tag=wall_gun_north] run function zbk:map_elements/wall_gun/display/update_display_north
execute if entity @s[tag=wall_gun_east] run function zbk:map_elements/wall_gun/display/update_display_east
