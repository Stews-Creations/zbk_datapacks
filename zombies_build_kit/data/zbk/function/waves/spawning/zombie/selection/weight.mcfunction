# As marker, positioned at player. Fixed-point offsets are only for sector classification.
scoreboard players operation @s wz_weight = #weight_outer wz_cfg
$execute if entity @s[distance=..$(middle)] run scoreboard players operation @s wz_weight = #weight_middle wz_cfg
$execute if entity @s[distance=..$(near)] run scoreboard players operation @s wz_weight = #weight_near wz_cfg
scoreboard players operation #age wz_state = #recent_ticks wz_cfg
execute if score @s wz_recent matches 0.. run scoreboard players operation #age wz_state = #now wz_state
execute if score @s wz_recent matches 0.. run scoreboard players operation #age wz_state -= @s wz_recent
execute if score #age wz_state >= #recent_ticks wz_cfg run scoreboard players operation @s wz_weight *= #fresh_factor wz_cfg
execute store result score #dx wz_state run data get entity @s Pos[0] 100
execute store result score #dz wz_state run data get entity @s Pos[2] 100
scoreboard players operation #dx wz_state -= #px wz_state
scoreboard players operation #dz wz_state -= #pz wz_state
scoreboard players operation #ax wz_state = #dx wz_state
scoreboard players operation #az wz_state = #dz wz_state
execute if score #ax wz_state matches ..-1 run scoreboard players operation #ax wz_state *= #negative wz_state
execute if score #az wz_state matches ..-1 run scoreboard players operation #az wz_state *= #negative wz_state
scoreboard players set @s wz_sector 0
execute if score #ax wz_state >= #az wz_state if score #dx wz_state matches ..-1 run scoreboard players set @s wz_sector 2
execute if score #ax wz_state < #az wz_state run scoreboard players set @s wz_sector 1
execute if score #ax wz_state < #az wz_state if score #dz wz_state matches ..-1 run scoreboard players set @s wz_sector 3
execute unless score @s wz_sector = #last_sector wz_state run scoreboard players operation @s wz_weight *= #sector_factor wz_cfg
scoreboard players operation #total wz_state += @s wz_weight
