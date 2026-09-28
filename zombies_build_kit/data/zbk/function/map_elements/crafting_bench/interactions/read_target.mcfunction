execute store result score @s cb_stamp run data get entity @s interaction.timestamp
execute if score @s cb_stamp = #now cb_stamp run scoreboard players operation #clicked cb_target = @s cb_id
execute if score @s cb_stamp = #now cb_stamp run data remove entity @s interaction
