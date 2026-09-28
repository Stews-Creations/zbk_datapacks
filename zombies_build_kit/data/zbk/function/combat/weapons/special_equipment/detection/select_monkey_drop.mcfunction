# Bind both the native thrower UUID and the item owner; nearby players cannot spend each other's drops.
tag @e[type=item,tag=special_equipment_drop] remove special_equipment_drop
$execute as @e[type=item,distance=..2,nbt={Thrower:$(uuid)}] if items entity @s contents minecraft:slime_ball[custom_data~{player_id:$(player_id),special_equipment:true,monkey_bomb:true}] run tag @s add special_equipment_drop
execute if entity @e[type=item,tag=special_equipment_drop,distance=..2] run function zbk:combat/weapons/special_equipment/monkey_bomb/drop_monkey_bomb
