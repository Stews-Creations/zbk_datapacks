execute unless score #active zbk.de matches 1 run return 0
execute if entity @s[tag=de_ag_air_jump_ready,nbt={OnGround:0b}] run function zbk:api/request/block
