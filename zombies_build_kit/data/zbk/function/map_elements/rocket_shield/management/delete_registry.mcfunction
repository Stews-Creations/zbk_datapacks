$data remove storage zbk:shield_parts candidates.$(part)[{id:$(id)}]
$execute if score #$(part) rs_chosen = #rs_delete rs_candidate run scoreboard players set #$(part) rs_chosen 0
