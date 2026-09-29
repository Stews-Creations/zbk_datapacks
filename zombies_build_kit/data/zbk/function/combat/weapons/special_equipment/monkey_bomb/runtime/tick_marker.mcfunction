# Context: one monkey marker selected by the equipment dispatcher.
# Position must be refreshed after physics; function calls alone do not follow a moved entity.

execute unless entity @s[tag=monkey_bomb_landed] run function zbk:combat/weapons/special_equipment/monkey_bomb/physics/update_position
# Physics changes Pos; refresh position before moving the paired decoy.
execute at @s run function zbk:combat/weapons/special_equipment/monkey_bomb/runtime/sync_decoy
