$execute if score #de_fuse_count temp matches 1 if items entity @s inventory.0 minecraft:paper[custom_data~{de_fuse_ui:1b,owned:$(owned)},item_model="$(model)"] run return 1
scoreboard players set #de_fuse_moved temp 1
execute if items entity @s inventory.0 * unless items entity @s inventory.0 minecraft:paper[custom_data~{de_fuse_ui:1b}] store result score #de_fuse_moved temp run function zbk_der_eisendrache:quest/hud/inventory/fuse/displace
execute unless score #de_fuse_moved temp matches 1 run return 0
clear @s minecraft:paper[custom_data~{de_fuse_ui:1b}]
$item replace entity @s inventory.0 with minecraft:paper[item_model="$(model)",custom_data={de_fuse_ui:1b,owned:$(owned)},max_stack_size=1,item_name={text:"Fuse",color:"gold"},lore=[{text:"$(status)",color:"gray",italic:false}]]
return 1
