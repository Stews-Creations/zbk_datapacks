execute unless score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/hud/inventory/fuse/clear
execute store result score #de_fuse_count temp run clear @s minecraft:paper[custom_data~{de_fuse_ui:1b}] 0
data modify storage zombies:quest_inventory fuse set value {owned:0,model:"zbk_der_eisendrache:powerups/fuse_empty",status:"No Fuse held"}
execute if score @s de_fuse matches 1.. run data modify storage zombies:quest_inventory fuse set value {owned:1,model:"zbk_der_eisendrache:powerups/fuse",status:"Fuse ready for the tram"}
function zbk_der_eisendrache:quest/hud/inventory/fuse/apply with storage zombies:quest_inventory fuse
