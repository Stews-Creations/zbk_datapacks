# Runs as the linked Tram 1 reward marker. Roll now so the player can see the prize.
execute store result score #tram_claim_roll temp run random value 1..2
summon minecraft:interaction ~ ~ ~ {width:1.25f,height:1.5f,response:true,Tags:["tram_reward_interaction"]}
scoreboard players operation @e[type=interaction,tag=tram_reward_interaction,distance=..0.1,limit=1,sort=nearest] tram_link_id = @s tram_link_id
scoreboard players operation @e[type=interaction,tag=tram_reward_interaction,distance=..0.1,limit=1,sort=nearest] tram_reward_type = #tram_claim_roll temp
execute if score #tram_claim_roll temp matches 1 run summon item_display ~ ~0.5 ~ {Tags:["tram_reward_ui","tram_reward_preview"],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:special_equipment/monkey_bomb/monkey_bomb"}},item_display:"fixed",brightness:{block:15,sky:15}}
execute if score #tram_claim_roll temp matches 2 run summon item_display ~ ~0.5 ~ {Tags:["tram_reward_ui","tram_reward_preview"],item:{id:"minecraft:ghast_tear",count:1,components:{"minecraft:item_model":"zbk:guns/shotguns/krm262","minecraft:enchantment_glint_override":true}},item_display:"fixed",brightness:{block:15,sky:15}}
scoreboard players operation @e[type=item_display,tag=tram_reward_preview,distance=..1,limit=1,sort=nearest] tram_link_id = @s tram_link_id
summon text_display ~ ~1.25 ~ {Tags:["tram_reward_ui","tram_reward_label"],billboard:"center",background:0,shadow:true,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},text:[{"text":"Claim Reward","color":"aqua","bold":true}]}
scoreboard players operation @e[type=text_display,tag=tram_reward_label,distance=..2,limit=1,sort=nearest] tram_link_id = @s tram_link_id
playsound minecraft:block.beacon.activate player @a[distance=..24] ~ ~ ~ 0.8 1.35
