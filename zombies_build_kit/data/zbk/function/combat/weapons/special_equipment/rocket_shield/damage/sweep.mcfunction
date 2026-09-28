# Called only during a validated active bash, as the owner at their current feet.
# World-aligned selector box: 3 wide, 2 tall, 1 deep, 0.1 blocks in front.
# Choose the nearest cardinal facing so width and depth swap when facing east/west.
scoreboard players operation #rs_basher temp = @s id
execute if entity @s[y_rotation=-45..45] run return run function zbk:combat/weapons/special_equipment/rocket_shield/damage/box {x:"~-1.5",z:"~0.1",dx:2,dz:0}
execute if entity @s[y_rotation=45..135] run return run function zbk:combat/weapons/special_equipment/rocket_shield/damage/box {x:"~-1.1",z:"~-1.5",dx:0,dz:2}
execute if entity @s[y_rotation=-135..-45] run return run function zbk:combat/weapons/special_equipment/rocket_shield/damage/box {x:"~0.1",z:"~-1.5",dx:0,dz:2}
function zbk:combat/weapons/special_equipment/rocket_shield/damage/box {x:"~-1.5",z:"~-1.1",dx:2,dz:0}
