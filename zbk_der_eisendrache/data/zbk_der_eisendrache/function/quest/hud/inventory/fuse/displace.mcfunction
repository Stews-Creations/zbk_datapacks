# Preserve a real item from the reserved slot, including count and all components.
summon item ~ ~0.5 ~ {Tags:["de_fuse_displaced"],PickupDelay:20s,Item:{id:"minecraft:paper",count:1}}
execute store success score #de_fuse_moved temp run item replace entity @e[type=item,tag=de_fuse_displaced,limit=1] contents from entity @s inventory.0
execute unless score #de_fuse_moved temp matches 1 run kill @e[type=item,tag=de_fuse_displaced]
tag @e[type=item,tag=de_fuse_displaced] remove de_fuse_displaced
execute unless score #de_fuse_moved temp matches 1 run return 0
tellraw @s {"text":"[Fuse UI] The item in the reserved Fuse slot was returned at your feet.","color":"gray"}
return 1
