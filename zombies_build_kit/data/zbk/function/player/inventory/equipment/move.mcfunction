$execute store success score #hud_moved temp run item replace entity @s $(destination) from entity @s $(source)
$execute if score #hud_moved temp matches 1 run item replace entity @s $(source) with minecraft:air
return run scoreboard players get #hud_moved temp
