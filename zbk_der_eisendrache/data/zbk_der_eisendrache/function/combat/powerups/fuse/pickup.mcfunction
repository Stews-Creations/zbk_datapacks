execute if score @s de_fuse matches 1.. run function zbk_der_eisendrache:combat/powerups/fuse/already_has
execute if score @s de_fuse matches 1.. run return 0

scoreboard players set @s de_fuse 1
scoreboard players set #global de_fuse 0
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.8 1.5
tellraw @s[tag=debug] [{"text":"[Der Eisendrache] ","color":"dark_aqua","bold":true},{"text":"Fuse collected.","color":"aqua"}]
# The calling chain keeps the execution position at the Fuse display even though @s is the player.
kill @e[type=item_display,tag=fuse,distance=..0.5,limit=1,sort=nearest]
