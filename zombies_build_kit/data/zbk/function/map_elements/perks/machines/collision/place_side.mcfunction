# Claim only empty cells. Never take ownership of an existing map pane.
$execute unless block ~$(x) ~$(y) ~$(z) air unless block ~$(x) ~$(y) ~$(z) cave_air unless block ~$(x) ~$(y) ~$(z) void_air run return 0
$setblock ~$(x) ~$(y) ~$(z) minecraft:magenta_stained_glass_pane[$(connections)]
$data modify entity @s data.pm_collision.$(key) set value 1b
