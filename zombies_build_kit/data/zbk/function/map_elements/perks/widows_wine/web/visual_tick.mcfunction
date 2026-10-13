scoreboard players set #ww_vehicle stats 0
execute on vehicle if entity @s[tag=ww_webbed] run scoreboard players set #ww_vehicle stats 1
execute if score #ww_vehicle stats matches 0 run kill @s
