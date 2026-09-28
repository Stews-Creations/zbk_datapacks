# Native loot carries the actual killer UUID; retain the item for the dragon's normal collector.
tag @s add de_quest_drop_checked
function zbk_der_eisendrache:quest/souls/native_owner with entity @s Item.components."minecraft:custom_data"
