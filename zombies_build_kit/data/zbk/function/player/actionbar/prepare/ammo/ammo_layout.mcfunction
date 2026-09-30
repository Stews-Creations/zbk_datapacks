# Fit the active magazine in 20 GUI pixels based on its digit count.
data merge storage zbk:hud {args:{magazine_font:"zbk:hud_magazine",ammo_leading:14}}
execute if score #hud_ammo temp matches 10..99 run data modify storage zbk:hud args.ammo_leading set value 8
execute if score #hud_ammo temp matches 100..999 run data modify storage zbk:hud args.ammo_leading set value 2
execute if score #hud_ammo temp matches 1000.. run data merge storage zbk:hud {args:{magazine_font:"zbk:hud_magazine_small",ammo_leading:0}}
