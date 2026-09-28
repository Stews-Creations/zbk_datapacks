# Preserve a real item from the reserved slot, including count and all components.
summon item ~ ~0.5 ~ {Tags:["de_quest_displaced"],PickupDelay:20s,Item:{id:"minecraft:paper",count:1}}
$execute store success score #de_hud_moved temp run item replace entity @e[type=item,tag=de_quest_displaced,limit=1] contents from entity @s inventory.$(slot)
execute unless score #de_hud_moved temp matches 1 run kill @e[type=item,tag=de_quest_displaced]
tag @e[type=item,tag=de_quest_displaced] remove de_quest_displaced
execute unless score #de_hud_moved temp matches 1 run return 0
tellraw @s {"text":"[Quest UI] The item in the reserved quest slot was returned at your feet.","color":"gray"}
return 1
