# Public creation contract: as/at marker, result 1 only on creation; leaves wz_created for caller.
tag @e[tag=wz_created] remove wz_created
tag @e[type=marker,tag=wz_source_marker] remove wz_source_marker
execute unless score @s wz_source matches 1.. store result score @s wz_source run scoreboard players add #next_source wz_state 1
tag @s add wz_source_marker
scoreboard players set #created wz_state 0
execute if entity @s[nbt={data:{mode:0}}] store result score #created wz_state run function zbk:waves/spawning/zombie/summon
execute if entity @s[nbt={data:{mode:1}}] store result score #created wz_state run function zbk:waves/spawning/zombie/hole/summon
execute if entity @s[nbt={data:{mode:2}}] store result score #created wz_state run function zbk:waves/spawning/zombie/hole/summon
execute if entity @s[nbt={data:{mode:3}}] store result score #created wz_state run function zbk:waves/spawning/zombie/hole/summon
execute if entity @s[nbt={data:{mode:4}}] store result score #created wz_state run function zbk:waves/spawning/zombie/hole/summon
execute if entity @s[nbt={data:{mode:5}}] store result score #created wz_state run function zbk:waves/spawning/zombie/wall/summon
execute if entity @s[nbt={data:{mode:6}}] store result score #created wz_state run function zbk:waves/spawning/zombie/wall/summon
execute if entity @s[nbt={data:{mode:7}}] store result score #created wz_state run function zbk:waves/spawning/zombie/wall/summon
execute if entity @s[nbt={data:{mode:8}}] store result score #created wz_state run function zbk:waves/spawning/zombie/wall/summon
tag @s remove wz_source_marker
return run scoreboard players get #created wz_state
