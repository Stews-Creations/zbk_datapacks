# Juggernog fits the existing column; the other cabinets need side coverage.
execute if entity @s[tag=perk_juggernog] run return 0
execute store result score #collision_yaw pm_v2_id run data get entity @s Rotation[0]
scoreboard players set #collision_axis pm_v2_id 0
execute if score #collision_yaw pm_v2_id matches 46..135 run scoreboard players set #collision_axis pm_v2_id 1
execute if score #collision_yaw pm_v2_id matches -135..-46 run scoreboard players set #collision_axis pm_v2_id 1
execute if score #collision_axis pm_v2_id matches 0 run function zbk:map_elements/perks/machines/collision/place_side {x:-1,y:0,z:0,key:"xn0",connections:"north=true,south=true,east=true,west=false"}
execute if score #collision_axis pm_v2_id matches 0 run function zbk:map_elements/perks/machines/collision/place_side {x:-1,y:1,z:0,key:"xn1",connections:"north=true,south=true,east=true,west=false"}
execute if score #collision_axis pm_v2_id matches 0 run function zbk:map_elements/perks/machines/collision/place_side {x:1,y:0,z:0,key:"xp0",connections:"north=true,south=true,east=false,west=true"}
execute if score #collision_axis pm_v2_id matches 0 run function zbk:map_elements/perks/machines/collision/place_side {x:1,y:1,z:0,key:"xp1",connections:"north=true,south=true,east=false,west=true"}
execute if score #collision_axis pm_v2_id matches 1 run function zbk:map_elements/perks/machines/collision/place_side {x:0,y:0,z:-1,key:"zn0",connections:"east=true,west=true,south=true,north=false"}
execute if score #collision_axis pm_v2_id matches 1 run function zbk:map_elements/perks/machines/collision/place_side {x:0,y:1,z:-1,key:"zn1",connections:"east=true,west=true,south=true,north=false"}
execute if score #collision_axis pm_v2_id matches 1 run function zbk:map_elements/perks/machines/collision/place_side {x:0,y:0,z:1,key:"zp0",connections:"east=true,west=true,south=false,north=true"}
execute if score #collision_axis pm_v2_id matches 1 run function zbk:map_elements/perks/machines/collision/place_side {x:0,y:1,z:1,key:"zp1",connections:"east=true,west=true,south=false,north=true"}
