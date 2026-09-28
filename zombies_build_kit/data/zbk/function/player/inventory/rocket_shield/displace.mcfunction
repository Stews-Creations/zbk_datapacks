summon item ~ ~0.5 ~ {Tags:["rs_ui_displaced"],PickupDelay:20s,Item:{id:"minecraft:paper",count:1}}
$execute store success score #rs_ui_moved temp run item replace entity @e[type=item,tag=rs_ui_displaced,sort=nearest,limit=1] contents from entity @s inventory.$(slot)
execute unless score #rs_ui_moved temp matches 1 run kill @e[type=item,tag=rs_ui_displaced]
tag @e[type=item,tag=rs_ui_displaced] remove rs_ui_displaced
execute unless score #rs_ui_moved temp matches 1 run return 0
$item replace entity @s inventory.$(slot) with minecraft:air
tellraw @s {text:"[Shield HUD] The item in the reserved slot was returned at your feet.",color:"gray"}
return 1
