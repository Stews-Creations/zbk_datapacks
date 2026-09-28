# Map dispatch owns entry; Adventure mode reserves the board slots.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @s[gamemode=adventure] unless score @s de_hud_preview matches 1..4 run return run function zbk_der_eisendrache:quest/hud/inventory/clear_all
scoreboard players add @s de_ui_clock 1
execute if score @s de_ui_clock matches 2..5 run return 0
scoreboard players set @s de_ui_clock 1
function zbk_der_eisendrache:quest/hud/inventory/fuse/update
function zbk_der_eisendrache:quest/hud/inventory/bow {quest:1,slot:19}
function zbk_der_eisendrache:quest/hud/inventory/owners/prepare {quest:1,slot:10}
function zbk_der_eisendrache:quest/hud/inventory/bow {quest:2,slot:21}
function zbk_der_eisendrache:quest/hud/inventory/owners/prepare {quest:2,slot:12}
function zbk_der_eisendrache:quest/hud/inventory/bow {quest:3,slot:23}
function zbk_der_eisendrache:quest/hud/inventory/owners/prepare {quest:3,slot:14}
function zbk_der_eisendrache:quest/hud/inventory/bow {quest:4,slot:25}
function zbk_der_eisendrache:quest/hud/inventory/owners/prepare {quest:4,slot:16}
function zbk_der_eisendrache:quest/hud/inventory/parts/apply {slot:6,key:4,model:"ragnarok_core_missing",name:"Ragnarok - core"}
function zbk_der_eisendrache:quest/hud/inventory/parts/apply {slot:7,key:5,model:"ragnarok_prongs_missing",name:"Ragnarok - prongs"}
function zbk_der_eisendrache:quest/hud/inventory/parts/apply {slot:8,key:6,model:"ragnarok_grip_missing",name:"Ragnarok - grip"}
