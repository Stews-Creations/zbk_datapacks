# Recheck eligibility and ownership at the player before consuming the selected drop.
execute unless score @s id matches 1.. run return 0
execute unless score @s perk_widows matches 1.. run return 0
execute if entity @s[team=downed] run return 0
execute unless score @s grenade_ammo matches 0..3 run return 0
execute unless entity @e[type=item_display,tag=ww_pickup_selected,distance=..1.5,limit=1] run return 0
execute unless score @s id = @e[type=item_display,tag=ww_pickup_selected,limit=1] ww_owner run return 0
execute unless score @e[type=item_display,tag=ww_pickup_selected,limit=1] perk_epoch = #current perk_epoch run return 0
scoreboard players add @s grenade_ammo 1
execute if score @s grenade_ammo matches 5.. run scoreboard players set @s grenade_ammo 4
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5 1.5
kill @e[tag=ww_pickup_selected,limit=1]
