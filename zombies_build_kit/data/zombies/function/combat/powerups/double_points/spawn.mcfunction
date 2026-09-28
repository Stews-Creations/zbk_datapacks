function zombies:debug/info {f:"DROP",m:"Double Points spawned"}

summon item_display ~ ~0.5 ~ {Tags:[pickup_item, double_points],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:double_points"}},item_display:"fixed",brightness:{block:15,sky:15}}

# Post-spawn: increment round drop count and reset kill gate
scoreboard players add #global drop_round_drops 1
scoreboard players set #global drop_req_kills 30
execute as @a[tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[DROP] ","color":"gold"},{"text":"Round drops: ","color":"white"},{"score":{"name":"#global","objective":"drop_round_drops"},"color":"yellow"},{"text":" | Req kills reset to 30","color":"white"}]

kill @s
