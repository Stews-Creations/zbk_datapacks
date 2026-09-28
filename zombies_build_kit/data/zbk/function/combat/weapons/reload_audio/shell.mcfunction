$function zbk:combat/weapons/reload_audio/stop {slug:"$(slug)",slot:$(slot)}
$execute unless score @s perk_speed matches 1.. at @s run playsound zbk:reload.$(slug).shell.slot$(slot) player @s ~ ~ ~ 0.8 1
$execute if score @s perk_speed matches 1.. at @s run playsound zbk:reload.$(slug).shell_fast.slot$(slot) player @s ~ ~ ~ 0.8 1
