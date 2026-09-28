# ===================================
# DROP MONKEY BOMB
# ===================================
# Called as the player, positioned at the player.

# Summon a physics marker and visual display from the player's view.
execute anchored eyes run summon marker ^ ^ ^0.5 {Tags:["new_monkey_bomb","monkey_bomb_marker","grenade_marker","active_monkey_bomb"]}
execute store result entity @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] data.thrower_id int 1 run scoreboard players get @s id
execute as @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] at @s rotated as @p run function zombies:combat/weapons/special_equipment/monkey_bomb/physics/calculate_velocity

execute at @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] run summon item_display ~ ~0.5 ~ {Tags:["special_equipment_display","monkey_bomb_display","monkey_bomb_new"],teleport_duration:2,brightness:{block:15,sky:15},shadow_radius:0.35f,shadow_strength:0.35f,item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zombies:monkey_bomb"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.65f,0.65f,0.65f]}}

# Link marker and display. The display timer starts after landing so the full song plays.
scoreboard players add #grenade_id_counter grenade_id 1
scoreboard players operation @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] grenade_id = #grenade_id_counter grenade_id
execute at @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] run scoreboard players operation @e[type=item_display,tag=monkey_bomb_new,sort=nearest,limit=1,distance=..1] grenade_id = #grenade_id_counter grenade_id
execute at @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] run summon zombie ~ ~-0.3 ~ {Team:"no_friendly_fire_team",NoAI:1b,NoGravity:1b,attributes:[{id:"minecraft:scale",base:0.0625}],Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Fire:0s,DeathLootTable:"minecraft:empty",Tags:["monkey_bomb_decoy","combat_ignore","monkey_bomb_new_decoy"],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b},{id:"minecraft:fire_resistance",amplifier:0,duration:-1,show_particles:0b}]}
execute at @e[type=marker,tag=new_monkey_bomb,limit=1,sort=nearest] run scoreboard players operation @e[type=zombie,tag=monkey_bomb_new_decoy,sort=nearest,limit=1,distance=..2] grenade_id = #grenade_id_counter grenade_id
tag @e[type=zombie,tag=monkey_bomb_new_decoy] remove monkey_bomb_new_decoy
scoreboard players set @e[type=item_display,tag=monkey_bomb_new] timer 250

tag @e[type=marker,tag=new_monkey_bomb] remove new_monkey_bomb
tag @e[type=item_display,tag=monkey_bomb_new] remove monkey_bomb_new

execute at @e[type=item,tag=special_equipment_drop,distance=..2,limit=1,sort=nearest] run playsound minecraft:entity.snowball.throw player @a[distance=..16] ~ ~ ~ 0.8 0.7

execute if score #global game_active matches 1.. run scoreboard players remove @s special_equipment_ammo 1
kill @e[type=item,tag=special_equipment_drop,distance=..2,limit=1,sort=nearest]

function zombies:player/inventory/special_equipment
