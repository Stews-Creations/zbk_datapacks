scoreboard players operation @s gun_side = @s set_gun_side
execute if score @s gun_side matches 1 run tellraw @s {text:"HUD and effects aligned: gun on LEFT. Set Main Hand to Right in Skin Customization.",color:"gold"}
execute if score @s gun_side matches 2 run tellraw @s {text:"HUD and effects aligned: gun on RIGHT. Set Main Hand to Left in Skin Customization.",color:"gold"}
