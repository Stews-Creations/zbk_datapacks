# Called once after a reload successfully starts, before any ammunition transfer.
execute unless score @s perk_cherry matches 1.. run return 0
execute if entity @s[team=downed] run return 0
$execute unless score @s max_ammo_$(slot) matches 1.. run return 0
$scoreboard players operation #cherry_spent stats = @s max_ammo_$(slot)
$scoreboard players operation #cherry_spent stats -= @s ammo_$(slot)
execute unless score #cherry_spent stats matches 1.. run return 0
# Radius in hundredths of a block: 6 * spent / capacity, clamped to 0.25..6.
scoreboard players set #cherry_scale stats 600
scoreboard players operation #cherry_spent stats *= #cherry_scale stats
$scoreboard players operation #cherry_spent stats /= @s max_ammo_$(slot)
execute if score #cherry_spent stats matches ..24 run scoreboard players set #cherry_spent stats 25
execute if score #cherry_spent stats matches 601.. run scoreboard players set #cherry_spent stats 600
execute at @s run function zbk:map_elements/perks/electric_cherry/effects/prepare
