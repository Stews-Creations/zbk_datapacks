# Read the old weapon before a slot is replaced or completed.
$execute if score @s gun_$(slot) matches 7 run return run function zbk:combat/weapons/reload_audio/stop {slug:"ray_gun",slot:$(slot)}
$execute unless score @s gun_$(slot) matches 20..46 run return 0
$function zbk:combat/weapons/guns/bo3/registry/select_$(slot)
function zbk:combat/weapons/reload_audio/stop with storage zbk:bo3 profile
