# Creation-only test: never consumes or refunds a round quota/speed slot.
scoreboard players operation #test_spawn_health temp = #global wave.health
execute if score #global game_active matches 0 run scoreboard players operation #global wave.health = #global game.start_round
execute if score #global game_active matches 0 run scoreboard players add #global wave.health 20
execute unless score #global wave.health matches 1.. run scoreboard players set #global wave.health 21
execute store result score #test_created wz_state run function zbk:waves/spawning/zombie/creation/create
execute as @e[type=zombified_piglin,tag=wz_created] run function zbk:behavior/ai/apply_stats
tag @e[tag=wz_created] remove wz_created
scoreboard players operation #global wave.health = #test_spawn_health temp
execute if score #test_created wz_state matches 1 run function zbk:debug/info {f:"WAVE",m:"Test zombie created without round accounting"}
execute unless score #test_created wz_state matches 1 run function zbk:debug/warn {f:"WAVE",m:"Test zombie creation failed; check marker mode"}
