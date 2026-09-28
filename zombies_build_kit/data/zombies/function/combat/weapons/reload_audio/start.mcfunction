# Per-slot events allow background reloads without stopping another slot.
$function zombies:combat/weapons/reload_audio/stop {slug:"$(slug)",slot:$(slot)}
$execute if score @s ammo_$(slot) matches 1.. unless score @s perk_speed matches 1.. at @s run playsound zbk:reload.$(slug).partial.slot$(slot) player @s ~ ~ ~ 0.8 1
$execute if score @s ammo_$(slot) matches 1.. if score @s perk_speed matches 1.. at @s run playsound zbk:reload.$(slug).partial_fast.slot$(slot) player @s ~ ~ ~ 0.8 1
$execute if score @s ammo_$(slot) matches ..0 unless score @s perk_speed matches 1.. at @s run playsound zbk:reload.$(slug).empty.slot$(slot) player @s ~ ~ ~ 0.8 1
$execute if score @s ammo_$(slot) matches ..0 if score @s perk_speed matches 1.. at @s run playsound zbk:reload.$(slug).empty_fast.slot$(slot) player @s ~ ~ ~ 0.8 1
