# Create mystery box facing east (180 rotation)
# Uses directional animations from mystery_box namespace
# Tags the root entity with facing_east for animation selection

function mystery_box:_/create
execute as @e[type=block_display,tag=mystery_box,distance=..2] run function zbk:map_elements/mystery_box/display/configure_rendering
tag @e[tag=mystery_box_root,type=block_display,distance=..2,limit=1,sort=nearest] add facing_east
