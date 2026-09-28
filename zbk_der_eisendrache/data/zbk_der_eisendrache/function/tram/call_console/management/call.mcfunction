# Temporary console manager: runs as the exact player who interacted.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @s[type=minecraft:player] run return 0

# Reject locked states without consuming the Fuse; chat diagnostics require debug.
execute if score #global tram_ee_timer matches 1.. run return run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"The console is cycling. Please wait.","color":"light_purple"}]
execute if entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1..2,tram_delay_timer=0..},limit=1] run return run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"The tram is already moving.","color":"yellow"}]
execute if entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1..2,tram_timer=..199},limit=1] run return run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"The tram is already moving.","color":"yellow"}]
execute if entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=2,tram_destination=3,tram_timer=200,tram_delay_timer=..-1},limit=1] run return run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"The tram is already at the platform.","color":"green"}]
execute unless entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=2,tram_destination=..2,tram_timer=200,tram_delay_timer=..-1},limit=1] run return run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"The tram cannot be called right now.","color":"red"}]
execute unless score @s tram_fuse_cd matches 0.. run scoreboard players set @s tram_fuse_cd 0
execute unless score @s de_fuse matches 1.. if score @s tram_fuse_cd matches 0 run playsound zbk_der_eisendrache:tram.vox_cast_maxis_gondola_pa_fuse master @s ~ ~ ~ 1 1
execute unless score @s de_fuse matches 1.. if score @s tram_fuse_cd matches 0 run scoreboard players set @s tram_fuse_cd 100
execute unless score @s de_fuse matches 1.. run return run tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"A Fuse is required to call the tram.","color":"red"}]

# Broadcast the successful call announcement without distance attenuation.
execute as @a at @s run playsound zbk_der_eisendrache:tram.vox_cast_maxis_gondola_pa_called master @s ~ ~ ~ 1 1

# Qualified players count successful calls independently. Their fifth call starts the one-time Tram 1 sequence.
execute if score @s tram_ee_ready matches 1.. unless score @s tram_ee_used matches 1.. run scoreboard players add @s tram_ee_calls 1
execute if score @s tram_ee_ready matches 1.. unless score @s tram_ee_used matches 1.. if score @s tram_ee_calls matches 5.. run return run function zbk_der_eisendrache:tram/easter_egg/management/start

# Consume the Fuse only after the guarded call has succeeded.
function zbk_der_eisendrache:tram/management/call {id:2}
scoreboard players set @s de_fuse 0
tellraw @s[tag=debug] [{"text":"[Tram] ","color":"gold","bold":true},{"text":"Fuse inserted. Tram called.","color":"aqua"}]
