# Read the old weapon before a slot is replaced or completed.
$execute if score @s gun_$(slot) matches 7 run return run function zombies:combat/weapons/reload_audio/stop {slug:"ray_gun",slot:$(slot)}
$execute unless score @s gun_$(slot) matches 20..46 run return 0
$function zombies:combat/weapons/guns/bo3/registry/select_$(slot)
function zombies:combat/weapons/reload_audio/stop with storage zombies:bo3 profile
