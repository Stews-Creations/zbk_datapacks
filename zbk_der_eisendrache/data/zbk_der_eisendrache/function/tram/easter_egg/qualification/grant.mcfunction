# Runs as the exact player who threw the qualifying grenade.
scoreboard players set @s tram_ee_ready 1
scoreboard players set @s tram_ee_calls 0
playsound minecraft:block.iron_trapdoor.close player @s ~ ~ ~ 0.65 0.55
tellraw @s[tag=debug] [{"text":"[Tram] ","color":"dark_green","bold":true},{"text":"Something clicks inside Tram 1...","color":"gray","italic":true}]
