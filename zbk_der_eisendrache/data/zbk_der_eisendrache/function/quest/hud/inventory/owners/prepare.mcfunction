# Capture each owner's real profile once; shared cache survives disconnects until reset.
scoreboard players set #de_owner temp 0
$execute if score #$(quest) de_bow_owner matches 1.. run scoreboard players operation #de_owner temp = #$(quest) de_bow_owner
data modify storage zombies:quest_inventory head set value {quest:0,slot:0,owner:0,available:0,status:"Unassigned",owner_name:"Unknown player"}
$data modify storage zombies:quest_inventory head.quest set value $(quest)
$data modify storage zombies:quest_inventory head.slot set value $(slot)
execute store result storage zombies:quest_inventory head.owner int 1 run scoreboard players get #de_owner temp
execute if score #de_owner temp matches 1.. run data modify storage zombies:quest_inventory head.status set value "Reserved - owner profile unavailable"
$execute if score #de_owner temp matches 1.. unless score #$(quest) de_ui_owner = #de_owner temp as @a if score @s id = #de_owner temp at @s run function zbk_der_eisendrache:quest/hud/inventory/owners/capture {quest:$(quest)}
$execute if score #de_owner temp matches 1.. if score #$(quest) de_ui_owner = #de_owner temp run data modify storage zombies:quest_inventory head.profile set from storage zombies:quest_inventory owners.q$(quest).profile
execute if data storage zombies:quest_inventory head.profile run data modify storage zombies:quest_inventory head.available set value 1
execute if data storage zombies:quest_inventory head.profile run data modify storage zombies:quest_inventory head.status set value "Assigned to this upgrade quest"
execute if data storage zombies:quest_inventory head.profile.name run data modify storage zombies:quest_inventory head.owner_name set from storage zombies:quest_inventory head.profile.name
function zbk_der_eisendrache:quest/hud/inventory/owners/apply with storage zombies:quest_inventory head
