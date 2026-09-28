# Build fixed-width HUD slots for the current player. Each render consumes this
# shared scratch storage synchronously before the next player is processed.

# Nine perk positions, filled left-to-right by acquisition order.
data merge storage zbk:hud {args:{perk_1:"\uE044",perk_2:"\uE044",perk_3:"\uE044",perk_4:"\uE044",perk_5:"\uE044",perk_6:"\uE044",perk_7:"\uE044",perk_8:"\uE044",perk_9:"\uE044"}}
execute store result storage zbk:hud args.perk_slot int 1 run scoreboard players get @s perk_jugg
data modify storage zbk:hud args.perk_glyph set value "\uE030"
execute if score @s perk_jugg matches 1..9 run function zbk:player/actionbar/prepare/perk with storage zbk:hud args
execute store result storage zbk:hud args.perk_slot int 1 run scoreboard players get @s perk_stamina
data modify storage zbk:hud args.perk_glyph set value "\uE031"
execute if score @s perk_stamina matches 1..9 run function zbk:player/actionbar/prepare/perk with storage zbk:hud args
execute store result storage zbk:hud args.perk_slot int 1 run scoreboard players get @s perk_speed
data modify storage zbk:hud args.perk_glyph set value "\uE032"
execute if score @s perk_speed matches 1..9 run function zbk:player/actionbar/prepare/perk with storage zbk:hud args
execute store result storage zbk:hud args.perk_slot int 1 run scoreboard players get @s perk_doubletap
data modify storage zbk:hud args.perk_glyph set value "\uE033"
execute if score @s perk_doubletap matches 1..9 run function zbk:player/actionbar/prepare/perk with storage zbk:hud args
execute store result storage zbk:hud args.perk_slot int 1 run scoreboard players get @s perk_revive
data modify storage zbk:hud args.perk_glyph set value "\uE034"
execute if score @s perk_revive matches 1..9 run function zbk:player/actionbar/prepare/perk with storage zbk:hud args
execute store result storage zbk:hud args.perk_slot int 1 run scoreboard players get @s perk_mule
data modify storage zbk:hud args.perk_glyph set value "\uE035"
execute if score @s perk_mule matches 1..9 run function zbk:player/actionbar/prepare/perk with storage zbk:hud args

# Three powerup slots remain centered as a group. One icon uses the middle
# slot; two straddle center; three use all slots in activation order.
data merge storage zbk:hud {args:{powerup_1:"\uE043",powerup_2:"\uE043",powerup_3:"\uE043"}}
execute if score active_powerups powerup_order matches 1 if score insta_kill powerup_order matches 1 run data modify storage zbk:hud args.powerup_2 set value "\uE040"
execute if score active_powerups powerup_order matches 1 if score double_points powerup_order matches 1 run data modify storage zbk:hud args.powerup_2 set value "\uE041"
execute if score active_powerups powerup_order matches 1 if score fire_sale powerup_order matches 1 run data modify storage zbk:hud args.powerup_2 set value "\uE042"
execute if score active_powerups powerup_order matches 2 if score insta_kill powerup_order matches 1 run data modify storage zbk:hud args.powerup_1 set value "\uE040"
execute if score active_powerups powerup_order matches 2 if score insta_kill powerup_order matches 2 run data modify storage zbk:hud args.powerup_3 set value "\uE040"
execute if score active_powerups powerup_order matches 2 if score double_points powerup_order matches 1 run data modify storage zbk:hud args.powerup_1 set value "\uE041"
execute if score active_powerups powerup_order matches 2 if score double_points powerup_order matches 2 run data modify storage zbk:hud args.powerup_3 set value "\uE041"
execute if score active_powerups powerup_order matches 2 if score fire_sale powerup_order matches 1 run data modify storage zbk:hud args.powerup_1 set value "\uE042"
execute if score active_powerups powerup_order matches 2 if score fire_sale powerup_order matches 2 run data modify storage zbk:hud args.powerup_3 set value "\uE042"
execute if score active_powerups powerup_order matches 3 if score insta_kill powerup_order matches 1 run data modify storage zbk:hud args.powerup_1 set value "\uE040"
execute if score active_powerups powerup_order matches 3 if score insta_kill powerup_order matches 2 run data modify storage zbk:hud args.powerup_2 set value "\uE040"
execute if score active_powerups powerup_order matches 3 if score insta_kill powerup_order matches 3 run data modify storage zbk:hud args.powerup_3 set value "\uE040"
execute if score active_powerups powerup_order matches 3 if score double_points powerup_order matches 1 run data modify storage zbk:hud args.powerup_1 set value "\uE041"
execute if score active_powerups powerup_order matches 3 if score double_points powerup_order matches 2 run data modify storage zbk:hud args.powerup_2 set value "\uE041"
execute if score active_powerups powerup_order matches 3 if score double_points powerup_order matches 3 run data modify storage zbk:hud args.powerup_3 set value "\uE041"
execute if score active_powerups powerup_order matches 3 if score fire_sale powerup_order matches 1 run data modify storage zbk:hud args.powerup_1 set value "\uE042"
execute if score active_powerups powerup_order matches 3 if score fire_sale powerup_order matches 2 run data modify storage zbk:hud args.powerup_2 set value "\uE042"
execute if score active_powerups powerup_order matches 3 if score fire_sale powerup_order matches 3 run data modify storage zbk:hud args.powerup_3 set value "\uE042"
