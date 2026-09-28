# Marker-local presentation state; readiness/ownership remain authoritative.
scoreboard players set #bow_available temp 0
$execute if score #$(quest) de_bow_ready matches 1 unless score #$(quest) de_bow_owner matches 1.. run scoreboard players set #bow_available temp 1
execute unless score @s de_bow_visual = #bow_available temp run function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
