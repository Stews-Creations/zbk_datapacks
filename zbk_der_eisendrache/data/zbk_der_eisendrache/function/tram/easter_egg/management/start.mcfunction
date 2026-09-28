# Replace this qualified player's fifth successful console call with the one-time Tram 1 sequence.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @s[type=minecraft:player] run return 0
execute unless score #global game_active matches 1.. run return 0
execute if score #global tram_ee_timer matches 1.. run return 0
execute unless score @s tram_ee_ready matches 1.. run return 0
execute if score @s tram_ee_used matches 1.. run return 0
execute unless score @s tram_ee_calls matches 5.. run return 0
execute unless score @s de_fuse matches 1.. run return 0

scoreboard players set @s tram_ee_used 1
scoreboard players set @s de_fuse 0
scoreboard players set #global tram_ee_timer 1
function zbk_der_eisendrache:tram/easter_egg/display/both_green
execute at @e[type=minecraft:marker,tag=tram_call_console,limit=1] run playsound minecraft:block.beacon.power_select player @a ~ ~ ~ 0.8 0.65
tellraw @s[tag=debug] [{"text":"[Tram] ","color":"dark_green","bold":true},{"text":"The console surges with an unfamiliar charge...","color":"light_purple","italic":true}]
