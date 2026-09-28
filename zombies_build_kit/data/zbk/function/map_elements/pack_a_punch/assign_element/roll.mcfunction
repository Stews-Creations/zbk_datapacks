# Roll a new element for a slot (macro). Caller passes {slot: 1|2|3}.
# First-time elemental weapons: simple 1..5 roll.
# Re-roll on an already-elemental weapon: pick from {1..5}\{prev} by rolling 1..4 then
# shifting up to skip the previous element — gives uniform distribution over the 4 remaining options.

$scoreboard players operation #prev_element stats = @s element_$(slot)

$execute if score #prev_element stats matches ..0 store result score @s element_$(slot) run random value 1..5

$execute if score #prev_element stats matches 1.. store result score @s element_$(slot) run random value 1..4
$execute if score #prev_element stats matches 1.. if score @s element_$(slot) >= #prev_element stats run scoreboard players add @s element_$(slot) 1
