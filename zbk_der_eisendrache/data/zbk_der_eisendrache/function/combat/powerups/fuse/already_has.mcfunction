execute if score @s fuse_notice matches 0 run tellraw @s [{"text":"[Der Eisendrache] ","color":"dark_aqua","bold":true},{"text":"You already have a Fuse.","color":"yellow"}]
scoreboard players set @s fuse_notice 20
