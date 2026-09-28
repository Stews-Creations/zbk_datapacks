# Existing padding encodes the active magazine digit count; fit it in 20 GUI pixels.
execute store result score #hud_ammo_pad temp run data get storage zombies:hud args.ammo_pad
data merge storage zombies:hud {args:{magazine_font:"zombies:hud_magazine",ammo_leading:14}}
execute if score #hud_ammo_pad temp matches 2 run data modify storage zombies:hud args.ammo_leading set value 8
execute if score #hud_ammo_pad temp matches 1 run data modify storage zombies:hud args.ammo_leading set value 2
execute if score #hud_ammo_pad temp matches 0 run data merge storage zombies:hud {args:{magazine_font:"zombies:hud_magazine_small",ammo_leading:0}}
