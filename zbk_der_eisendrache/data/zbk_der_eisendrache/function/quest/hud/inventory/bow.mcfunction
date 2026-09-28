# One fixed board position per quest; ownership never determines which emblem is visible.
$scoreboard players set #de_hud_kind temp $(quest)
scoreboard players set #de_hud_fill temp 0
execute if score #de_hud_kind temp matches 1 run scoreboard players operation #de_hud_fill temp = #electric de_el_progress
execute if score @s de_hud_preview = #de_hud_kind temp run scoreboard players operation #de_hud_fill temp = @s de_hud_stage
execute unless score #de_hud_fill temp matches 0..4 run scoreboard players set #de_hud_fill temp 0
data modify storage zombies:quest_inventory args set value {quest:0,stage:0,preview:0,active:0,model:0,name:"",color:"white",status:"Shared upgrade quest progress",progress:"Progress indicators not connected yet"}
execute store result storage zombies:quest_inventory args.quest int 1 run scoreboard players get #de_hud_kind temp
execute store result storage zombies:quest_inventory args.stage int 1 run scoreboard players get #de_hud_fill temp
scoreboard players set #de_hud_ten temp 10
scoreboard players operation #de_hud_model temp = #de_hud_kind temp
scoreboard players operation #de_hud_model temp *= #de_hud_ten temp
scoreboard players operation #de_hud_model temp += #de_hud_fill temp
execute store result storage zombies:quest_inventory args.model float 1 run scoreboard players get #de_hud_model temp
execute if score #de_hud_kind temp matches 1 if score #de_hud_fill temp matches 0 run data modify storage zombies:quest_inventory args.progress set value "0/4 - Light all three fires"
execute if score #de_hud_kind temp matches 1 if score #de_hud_fill temp matches 1 run data modify storage zombies:quest_inventory args.progress set value "1/4 - All three fires lit"
execute if score #de_hud_kind temp matches 1 if score #de_hud_fill temp matches 2 run data modify storage zombies:quest_inventory args.progress set value "2/4 - Five-panel loop complete"
execute if score #de_hud_kind temp matches 1 if score #de_hud_fill temp matches 3 run data modify storage zombies:quest_inventory args.progress set value "3/4 - Three charged fire hits complete"
execute if score #de_hud_kind temp matches 1 if score #de_hud_fill temp matches 4 run data modify storage zombies:quest_inventory args.progress set value "4/4 - Reforged arrow reclaimed"
execute if score @s de_hud_preview = #de_hud_kind temp run data modify storage zombies:quest_inventory args.preview set value 1
execute if score @s de_hud_preview = #de_hud_kind temp run data modify storage zombies:quest_inventory args.status set value "PREVIEW - cosmetic only"
execute if score @s de_hud_preview = #de_hud_kind temp run data modify storage zombies:quest_inventory args.progress set value "Sample progress; quest state unchanged"
execute if score #de_hud_kind temp matches 1 run data modify storage zombies:quest_inventory args.name set value "Electric"
execute if score #de_hud_kind temp matches 1 run data modify storage zombies:quest_inventory args.color set value "aqua"
execute if score #de_hud_kind temp matches 2 run data modify storage zombies:quest_inventory args.name set value "Fire"
execute if score #de_hud_kind temp matches 2 run data modify storage zombies:quest_inventory args.color set value "red"
execute if score #de_hud_kind temp matches 3 run data modify storage zombies:quest_inventory args.name set value "Wolf"
execute if score #de_hud_kind temp matches 3 run data modify storage zombies:quest_inventory args.color set value "green"
execute if score #de_hud_kind temp matches 4 run data modify storage zombies:quest_inventory args.name set value "Void"
execute if score #de_hud_kind temp matches 4 run data modify storage zombies:quest_inventory args.color set value "light_purple"
# First claim activates the emblem permanently until the quest is reset.
$execute if score #$(quest) de_bow_started matches 1 run data modify storage zombies:quest_inventory args.active set value 1
$execute if score #$(quest) de_bow_owner matches 1.. run data modify storage zombies:quest_inventory args.active set value 1
execute if score #de_hud_fill temp matches 1..4 run data modify storage zombies:quest_inventory args.active set value 1
execute if score @s de_hud_preview = #de_hud_kind temp run data modify storage zombies:quest_inventory args.active set value 1
execute if data storage zombies:quest_inventory args{active:0} run scoreboard players remove #de_hud_model temp 1
execute store result storage zombies:quest_inventory args.model float 1 run scoreboard players get #de_hud_model temp
execute if data storage zombies:quest_inventory args{active:0} run data modify storage zombies:quest_inventory args.status set value "Quest arrow not claimed"
execute if data storage zombies:quest_inventory args{active:0} run data modify storage zombies:quest_inventory args.progress set value "Claim the quest arrow to begin"
execute if data storage zombies:quest_inventory args{active:0} run data modify storage zombies:quest_inventory args.color set value "dark_gray"
$data modify storage zombies:quest_inventory args.slot set value $(slot)
function zbk_der_eisendrache:quest/hud/inventory/apply with storage zombies:quest_inventory args
