# === MACRO: Tag block_displays and item_displays for animation ===
# Assigns door ID score and anim tags to all displays in zone
# Called from: buy/open, buy/open_animated
$scoreboard players set @e[type=block_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] custom_door_id $(door_id)
$tag @e[type=block_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] add cd_anim_bd
$scoreboard players set @e[type=item_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] custom_door_id $(door_id)
$tag @e[type=item_display,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(dx),dy=$(dy),dz=$(dz)] add cd_anim_id
