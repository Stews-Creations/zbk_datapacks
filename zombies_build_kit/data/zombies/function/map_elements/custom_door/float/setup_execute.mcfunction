# === CUSTOM DOOR FLOAT - SETUP EXECUTE (MACRO) ===
# Tags block_displays in zone and summons center marker with spread data

# Tag block_displays and item_displays in the zone
$tag @e[type=block_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] add cd_float_bd
$tag @e[type=item_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] add cd_float_id

# Summon center marker with particle spread data
$summon marker $(center_x) $(center_y) $(center_z) {Tags:["cd_float_center"],data:{float_params:{spread_x:$(spread_x),spread_y:$(spread_y),spread_z:$(spread_z)}}}
