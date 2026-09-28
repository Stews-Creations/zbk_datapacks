# Match native thrower and owned knife before consuming the drop.
execute unless entity @s[nbt={SelectedItemSlot:3}] run return 0
execute if items entity @s hotbar.3 *[custom_data~{knife:true}] run return 0
execute unless score @s id matches 1.. run return 0
execute store result storage zombies:temp grenade_drop.player_id int 1 run scoreboard players get @s id
data modify storage zombies:temp grenade_drop.uuid set from entity @s UUID
function zombies:combat/weapons/grenade/detection/select_drop with storage zombies:temp grenade_drop
data remove storage zombies:temp grenade_drop
