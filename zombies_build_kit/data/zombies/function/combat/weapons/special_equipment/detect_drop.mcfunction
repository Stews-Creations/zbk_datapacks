# Only a real owner dropping from the selected tactical slot can throw a Monkey Bomb.
tag @e[type=item,tag=special_equipment_drop] remove special_equipment_drop
execute as @a[scores={special_equipment=1,special_equipment_ammo=1..},nbt={SelectedItemSlot:4}] at @s run function zombies:combat/weapons/special_equipment/detection/check_monkey_drop
# Moved/cursor copies and Trip Mine Q-drops are discarded without spending ammo.
execute as @e[type=item] if items entity @s contents *[custom_data~{special_equipment:true}] run kill @s
