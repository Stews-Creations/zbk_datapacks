# A recipe reset also clears the shield build state.
scoreboard players set #shield cb_build 0
execute in minecraft:overworld run function zbk:map_elements/rocket_shield/marker/register_pending
execute in minecraft:the_nether run function zbk:map_elements/rocket_shield/marker/register_pending
execute in minecraft:the_end run function zbk:map_elements/rocket_shield/marker/register_pending
# Reset the shared recipe and reroll from the persistent candidate registry, including unloaded locations.
scoreboard players add #run rs_epoch 1
scoreboard players reset * rs_ui_preview
clear @a *[custom_data~{rs_part_ui:true}]
scoreboard players set #plate rs_collected 0
function zbk:map_elements/rocket_shield/management/select {part:"plate"}
scoreboard players set #mechanism rs_collected 0
function zbk:map_elements/rocket_shield/management/select {part:"mechanism"}
scoreboard players set #rocket rs_collected 0
function zbk:map_elements/rocket_shield/management/select {part:"rocket"}
execute in minecraft:overworld run function zbk:map_elements/rocket_shield/display/rebuild
execute in minecraft:the_nether run function zbk:map_elements/rocket_shield/display/rebuild
execute in minecraft:the_end run function zbk:map_elements/rocket_shield/display/rebuild
