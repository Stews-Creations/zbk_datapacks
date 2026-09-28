scoreboard objectives add zbk.template dummy
scoreboard objectives add zbk_template_demo trigger
scoreboard players set #active zbk.template 0
function zbk:api/map/register {id:"zbk_template",version:10000}
execute unless score #block_start zbk.template matches 0.. run scoreboard players set #block_start zbk.template 0
execute unless score #defer_start zbk.template matches 0.. run scoreboard players set #defer_start zbk.template 0
execute unless score #block_jump_pad zbk.template matches 0.. run scoreboard players set #block_jump_pad zbk.template 0
