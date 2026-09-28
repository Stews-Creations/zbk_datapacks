# Called as a player at their position. Never borrow or clear a player inventory slot.
data remove storage zbk:player_profile current
summon item ~ ~ ~ {Tags:["zbk_profile_capture"],PickupDelay:32767s,Item:{id:"minecraft:paper",count:1}}
loot replace entity @e[type=item,tag=zbk_profile_capture,limit=1] contents loot zbk:player_head
data modify storage zbk:player_profile current set from entity @e[type=item,tag=zbk_profile_capture,limit=1] Item.components."minecraft:profile"
kill @e[type=item,tag=zbk_profile_capture]
execute if data storage zbk:player_profile current.name run return 1
return 0
