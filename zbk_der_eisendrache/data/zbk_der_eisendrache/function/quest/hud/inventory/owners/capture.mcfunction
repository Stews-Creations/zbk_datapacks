# Called as the owner. A temporary item avoids touching their inventory or equipment.
summon item ~ ~ ~ {Tags:["de_profile_capture"],PickupDelay:32767s,Item:{id:"minecraft:paper",count:1}}
loot replace entity @e[type=item,tag=de_profile_capture,limit=1] contents loot zombies:player_head
$data modify storage zombies:quest_inventory owners.q$(quest).profile set from entity @e[type=item,tag=de_profile_capture,limit=1] Item.components."minecraft:profile"
$execute if data storage zombies:quest_inventory owners.q$(quest).profile run scoreboard players operation #$(quest) de_ui_owner = @s id
kill @e[type=item,tag=de_profile_capture]
