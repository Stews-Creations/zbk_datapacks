# Summons trap corner1 marker on the exact frame block (TileX/TileZ).
# Expects storage minecraft:temp trap_place with x and z ints.
$summon marker $(x).5 ~ $(z).5 {Tags:["trap_corner","trap_corner1"]}
