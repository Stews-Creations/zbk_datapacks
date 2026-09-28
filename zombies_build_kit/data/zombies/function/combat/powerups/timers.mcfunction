# Drops
function zbk:dispatch/extension/combat/powerups/timers/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute as @e[type=item_display,tag=pickup_item] at @s if score @s timer matches 1 run kill @s
execute as @e[type=item_display,tag=pickup_item] at @s if score @s timer matches 1.. run scoreboard players remove @s timer 1

# Double points
execute if score #double_points timer matches 1 run function zombies:combat/powerups/double_points/cleanup
execute if score #double_points timer matches 1.. run scoreboard players remove #double_points timer 1

# Instant Kill
execute if score #insta_kill timer matches 1 run function zombies:combat/powerups/insta_kill/cleanup
execute if score #insta_kill timer matches 1.. run scoreboard players remove #insta_kill timer 1

# Fire sale
execute if score #fire_sale timer matches 1 run function zombies:combat/powerups/fire_sale/cleanup
execute if score #fire_sale timer matches 1.. run scoreboard players remove #fire_sale timer 1

# Death Machine: per-player timer; decrement and cleanup happen in combat/powerups/on_tick_as_player.
