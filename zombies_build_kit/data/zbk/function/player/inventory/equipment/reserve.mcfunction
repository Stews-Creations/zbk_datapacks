# Called after the owned item type has been cleared. Keep displaced real stacks intact.
$execute unless items entity @s $(slot) * run return 1
$function zbk:player/inventory/equipment/preserve {source:"$(slot)"}
$execute unless items entity @s $(slot) * run return 1
# A full backpack must not disable enforced equipment. Return the displaced stack at the player's feet.
execute at @s run summon item ~ ~0.5 ~ {Tags:["equipment_displaced"],PickupDelay:20s,Item:{id:"minecraft:paper",count:1}}
$execute at @s store success score #equipment_displaced temp run item replace entity @e[type=item,tag=equipment_displaced,distance=..1,limit=1,sort=nearest] contents from entity @s $(slot)
execute unless score #equipment_displaced temp matches 1 at @s run kill @e[type=item,tag=equipment_displaced,distance=..1]
execute at @s run tag @e[type=item,tag=equipment_displaced,distance=..1] remove equipment_displaced
execute unless score #equipment_displaced temp matches 1 run return 0
$item replace entity @s $(slot) with minecraft:air
tellraw @s {text:"The item in your equipment slot was returned at your feet because your inventory is full.",color:"gray"}
return 1
