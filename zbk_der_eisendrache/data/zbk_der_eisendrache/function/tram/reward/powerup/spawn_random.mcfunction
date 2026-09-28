# A Tram 2 reward is independent of the normal zombie-drop cap and kill gate.
# From Round 6 onward, roll the owner-only Ray Gun chance before the standard pool.
scoreboard players set #tram_reward_owner global 0
scoreboard players operation #tram_reward_owner global = @s tram_reward_own
scoreboard players set #tram_owner_found temp 0
scoreboard players set #tram_owner_has_raygun temp 0
execute as @a if score @s id = #tram_reward_owner global run scoreboard players set #tram_owner_found temp 1
execute as @a if score @s id = #tram_reward_owner global if score @s gun_1 matches 7 run scoreboard players set #tram_owner_has_raygun temp 1
execute as @a if score @s id = #tram_reward_owner global if score @s gun_2 matches 7 run scoreboard players set #tram_owner_has_raygun temp 1
execute as @a if score @s id = #tram_reward_owner global if score @s gun_3 matches 7 run scoreboard players set #tram_owner_has_raygun temp 1

execute store result score #tram_raygun_roll temp run random value 1..100
execute if score #global wave.round matches 6.. if score #tram_raygun_roll temp matches 1 if score #tram_owner_found temp matches 1 if score #tram_owner_has_raygun temp matches 0 run function zbk_der_eisendrache:tram/reward/claim/spawn_ray_gun
execute if score #global wave.round matches 6.. if score #tram_raygun_roll temp matches 1 if score #tram_owner_found temp matches 1 if score #tram_owner_has_raygun temp matches 0 run return 0

# Rounds 1-5 use three drops. Round 6 onward adds Nuke.
execute store result score #tram_powerup_roll temp run random value 1..3
execute if score #global wave.round matches 6.. store result score #tram_powerup_roll temp run random value 1..4
execute if score #tram_powerup_roll temp matches 1 run summon item_display ~ ~0.5 ~ {Tags:["pickup_item","max_ammo","tram_reward_pickup"],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zombies:max_ammo"}},item_display:"fixed",brightness:{block:15,sky:15}}
execute if score #tram_powerup_roll temp matches 2 run summon item_display ~ ~0.5 ~ {Tags:["pickup_item","double_points","tram_reward_pickup"],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zombies:double_points"}},item_display:"fixed",brightness:{block:15,sky:15}}
execute if score #tram_powerup_roll temp matches 3 run summon item_display ~ ~0.5 ~ {Tags:["pickup_item","insta_kill","tram_reward_pickup"],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zombies:insta_kill"}},item_display:"fixed",brightness:{block:15,sky:15}}
execute if score #tram_powerup_roll temp matches 4 run summon item_display ~ ~0.5 ~ {Tags:["pickup_item","nuke","tram_reward_pickup"],item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zombies:nuke"}},item_display:"fixed",brightness:{block:15,sky:15}}
scoreboard players operation @e[type=item_display,tag=tram_reward_pickup,distance=..1,limit=1,sort=nearest] tram_link_id = @s tram_link_id
playsound minecraft:block.beacon.activate player @a[distance=..24] ~ ~ ~ 0.8 1.35
