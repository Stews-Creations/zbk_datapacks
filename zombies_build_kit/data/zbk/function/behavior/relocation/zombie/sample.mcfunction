# A 0.25-block displacement from the reference position restarts the observation window.
execute unless score @s zr_still matches 0.. run return run function zbk:behavior/relocation/zombie/remember
$execute if entity @a[gamemode=adventure,team=!downed,distance=..$(distance)] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @e[type=marker,tag=barrier,scores={barrier_state=..5},distance=..6] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[tag=turned_zombie] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[tag=tw_launching] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[tag=bf_burning] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[tag=fw_marked] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[tag=dw_zapped] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[nbt={NoAI:1b}] run return run function zbk:behavior/relocation/zombie/remember
execute if entity @s[nbt={NoGravity:1b}] run return run function zbk:behavior/relocation/zombie/remember
execute if data entity @s active_effects[{id:"minecraft:levitation"}] run return run function zbk:behavior/relocation/zombie/remember
execute if data entity @s active_effects[{id:"minecraft:slowness"}] run return run function zbk:behavior/relocation/zombie/remember
execute store result score #x zr_state run data get entity @s Pos[0] 100
execute store result score #y zr_state run data get entity @s Pos[1] 100
execute store result score #z zr_state run data get entity @s Pos[2] 100
scoreboard players operation #x zr_state -= @s zr_x
scoreboard players operation #y zr_state -= @s zr_y
scoreboard players operation #z zr_state -= @s zr_z
execute if score #x zr_state matches ..-1 run scoreboard players operation #x zr_state *= #negative wz_state
execute if score #y zr_state matches ..-1 run scoreboard players operation #y zr_state *= #negative wz_state
execute if score #z zr_state matches ..-1 run scoreboard players operation #z zr_state *= #negative wz_state
execute if score #x zr_state >= #movement zr_cfg run return run function zbk:behavior/relocation/zombie/remember
execute if score #y zr_state >= #movement zr_cfg run return run function zbk:behavior/relocation/zombie/remember
execute if score #z zr_state >= #movement zr_cfg run return run function zbk:behavior/relocation/zombie/remember
scoreboard players add @s zr_still 1
execute if score @s zr_still >= #still_seconds zr_cfg if score #budget zr_state matches 1.. run function zbk:behavior/relocation/zombie/consider
