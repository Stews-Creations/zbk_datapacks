# Runs as the purchaser who claimed the visible Tram 2 Ray Gun reward.
function zbk:api/combat/weapons/guns/ray_gun/give/main
function zbk:api/player/inventory/weapons
playsound minecraft:entity.item.pickup player @s ~ ~ ~ 1 1
tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold"},{"text":"Ray Gun claimed.","color":"green"}]
